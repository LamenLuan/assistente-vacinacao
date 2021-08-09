import 'package:assistente_vacinacao/database/db_firestore.dart';
import 'package:assistente_vacinacao/models/agendamento.dart';
import 'package:assistente_vacinacao/models/usuario.dart';
import 'package:assistente_vacinacao/services/auth_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class UsuariosRepository extends ChangeNotifier {
  static List<Usuario> cidadaos = [];

  Usuario? autenticado;
  
  late FirebaseFirestore db;
  late AuthService authService;

  _startFirestore() {
    db = DBFirestore.get();
  }

  _readCidadaos() async {
    if(authService.usuario != null && cidadaos.isEmpty) {
      final snapshot = await db.collection('usuarios').get();
      snapshot.docs.forEach((doc) {
        cidadaos.add(
          Usuario(
            cpf: doc.get('cpf'),
            nome: doc.get('nome'),
            dataNascimento: DateTime.fromMillisecondsSinceEpoch(
              doc.get('dataNascimento')
            ),
            masculino: doc.get('masculino'),
            comorbidade: doc.get('comorbidade'),
            telefone: doc.get('telefone')
          )
        );
      });
      notifyListeners();
    }
  }

  _starRepository() async {
    await _startFirestore();
    await _readCidadaos();
    await getUsuarioAutenticado();
  }

  UsuariosRepository({required this.authService}) {
    _starRepository();
  }

  saveCidadao(Usuario cidadao) async {
    await db.collection('usuarios').doc(authService.usuario!.uid).set({
      'cpf': cidadao.cpf,
      'nome': cidadao.nome,
      'dataNascimento': cidadao.dataNascimento.millisecondsSinceEpoch,
      'masculino': cidadao.masculino,
      'comorbidade': cidadao.comorbidade,
      'telefone': cidadao.telefone
    });
    cidadaos.add(cidadao);
    await getUsuarioAutenticado();
    notifyListeners();
  }

  getUsuarioAutenticado() async {
    Usuario usuario = Usuario(
      cpf: '',
      nome: '',
      dataNascimento: DateTime(2000),
      masculino: true,
      comorbidade: false,
      telefone: ''
    );

    await db.collection('usuarios').doc(authService.usuario!.uid).get().then(
      (value) {
        usuario.cpf = value.get('cpf');
        usuario.nome = value.get('nome');
        usuario.dataNascimento = DateTime.fromMillisecondsSinceEpoch(
          value.get('dataNascimento')
        );
        usuario.masculino = value.get('masculino');
        usuario.comorbidade = value.get('comorbidade');
        usuario.telefone = value.get('telefone');
      }
    );

    final agendamento = await db.collection('agendamentos').doc(
      authService.usuario!.uid
    ).get();

    if(agendamento.exists) usuario.setAgendamento(
      Agendamento(
        data: agendamento.get('data'),
        dose: agendamento.get('dose'),
        nomePosto: agendamento.get('nomePosto'),
        endereco: agendamento.get('endereco')
      )
    );

    autenticado = usuario;
    notifyListeners();
  }

  cancelaAgendamento() async {
    await db.collection('agendamentos').doc(
      authService.usuario!.uid
    ).delete();
    autenticado!.setAgendamento(null);
    notifyListeners();
  }

  saveAgendamento(Agendamento novoAgendamento) async {
    await db.collection('agendamentos').doc(
      authService.usuario!.uid
    ).set({
      'data': novoAgendamento.data,
      'dose': novoAgendamento.dose,
      'nomePosto': novoAgendamento.nomePosto,
      'endereco': novoAgendamento.endereco
    });
    autenticado!.setAgendamento(novoAgendamento);
    notifyListeners();
  }

  static Usuario? findCidadaoCPF(String cpf)
  {
    for (var cidadao in cidadaos) {
      if(cidadao.cpf == cpf) return cidadao;
    }
  }
}