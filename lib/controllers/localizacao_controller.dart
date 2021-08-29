import 'package:assistente_vacinacao/models/posto_de_saude.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocalizacaoController extends ChangeNotifier {
  double lat = 0.0;
  double long = 0.0;
  String erro = '';
  static late GoogleMapController _mapsController;

  get mapsController => _mapsController;

  Future<Position> _posicaoAtual() async {
    LocationPermission permissao;
    bool ativado = await Geolocator.isLocationServiceEnabled();
    
    if(!ativado) return Future.error(
      'Por favor, habilite a localização no aparelho'
    );

    permissao = await Geolocator.checkPermission();

    if(permissao == LocationPermission.denied) {
      permissao = await Geolocator.requestPermission();
      if (permissao == LocationPermission.denied) {
        return Future.error(
          'Você precisa autorizar o acesso a localização'
        );
      }
    }

    if(permissao == LocationPermission.deniedForever) return Future.error(
      'Você precisa autorizar o acesso a localização'
    );

    return await Geolocator.getCurrentPosition();
  }

  void getPosicao() async {
    try {
      Position posicao = await _posicaoAtual();
      lat = posicao.latitude;
      long = posicao.longitude;
    } catch (e) {
      erro = e.toString();
    }
    notifyListeners();
  }

  void onMapCreated(GoogleMapController controller) async {
    _mapsController = controller;
    getPosicao();
  }

  static void centralizaPosto(PostoDeSaude posto) async {
    await _mapsController.animateCamera(CameraUpdate.newLatLng(
      LatLng(posto.latitude, posto.longitude)
    ));
  }
}