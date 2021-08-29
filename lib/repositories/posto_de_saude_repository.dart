import 'package:assistente_vacinacao/database/db_firestore.dart';
import 'package:assistente_vacinacao/models/posto_de_saude.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class PostoDeSaudeRepository extends ChangeNotifier {
  static List<PostoDeSaude> postos = [];
  late FirebaseFirestore db;

  _startFirestore() {
    db = DBFirestore.get();
  }

  _readPostos() async {
    final snapshot = await db.collection('postos').get();
    snapshot.docs.forEach((doc) {
      postos.add(
        PostoDeSaude(
          diasDisponiveis: doc.get('diasDisponiveis'),
          endereco: doc.get('endereco'),
          nome: doc.get('nome'),
          latitude: doc.get('latitude'),
          longitude: doc.get('longitude')
        )
      );
    });
    notifyListeners();
  }

  _starRepository() async {
    await _startFirestore();
    await _readPostos();
  }

  PostoDeSaudeRepository() {
    _starRepository();
  }

  static PostoDeSaude? findPosto(String nome) {
    for (var posto in postos) {
      if (posto.nome == nome) return posto;
    }
  }

  devolveDose(String posto, String data) async {
    PostoDeSaude p = findPosto(posto)!;
    p.diasDisponiveis.update(data, (value) => ++value);
    await db.collection('postos').doc(posto).update({
      'diasDisponiveis': p.diasDisponiveis
    });
    notifyListeners();
  }
}
