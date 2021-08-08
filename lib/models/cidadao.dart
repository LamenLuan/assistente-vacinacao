import 'package:assistente_vacinacao/models/agendamento.dart';

class Cidadao {
  String cpf, senha, nome, email, telefone;
  DateTime dataNascimento;
  bool isMasculino, comorbidade, temAgendamento = false;
  late Agendamento agendamento;

  Cidadao({
    required this.cpf,
    required this.senha,
    required this.nome,
    required this.dataNascimento,
    required this.isMasculino,
    required this.comorbidade,
    required this.email,
    required this.telefone,
  });

  setAgendamento(Agendamento? agendamento) {
    if(agendamento != null) {
      this.agendamento = agendamento;
      temAgendamento = true;
    } else temAgendamento = false;
  } 
}
