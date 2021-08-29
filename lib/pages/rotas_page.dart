import 'package:assistente_vacinacao/controllers/localizacao_controller.dart';
import 'package:assistente_vacinacao/models/agendamento.dart';
import 'package:assistente_vacinacao/repositories/posto_de_saude_repository.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class RotasPage extends StatefulWidget {
  final Agendamento? agendamento;
  RotasPage({
    Key? key,
    this.agendamento
  }) : super(key: key);

  @override
  _RotasPageState createState() => _RotasPageState();
}

class _RotasPageState extends State<RotasPage> {
  @override
  Widget build(BuildContext context) {
    final nomePosto = widget.agendamento!.nomePosto;
    final posto = PostoDeSaudeRepository.findPosto(nomePosto);

    return Scaffold(
      appBar: AppBar(
        title: Text('Mapa'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => LocalizacaoController.centralizaPosto(posto!),
            icon: Icon(Icons.location_pin)
          )
        ],
      ),
      body: ChangeNotifierProvider<LocalizacaoController>(
        create: (context) => LocalizacaoController(),
        child: Builder(builder: (context) {
          final local = context.watch<LocalizacaoController>();

          return local.erro == ''
           ? GoogleMap(
              initialCameraPosition: CameraPosition(
                target: LatLng(posto!.latitude, posto.longitude),
                zoom: 15
              ),
              myLocationEnabled: true,
              onMapCreated: local.onMapCreated,
              markers: {
                Marker(
                  markerId: MarkerId(nomePosto),
                  position: LatLng(posto.latitude, posto.longitude),
                )
              },
              
            )
            : Center(
              child: Text(local.erro)
            );
        }),
      ),
    );
  }
}