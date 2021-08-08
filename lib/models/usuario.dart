import 'package:assistente_vacinacao/models/agendamento.dart';

class Usuario {
  String cpf, nome, telefone;
  DateTime dataNascimento;
  bool masculino, comorbidade, temAgendamento = false;
  late Agendamento agendamento;

  Usuario({
    required this.cpf,
    required this.nome,
    required this.dataNascimento,
    required this.masculino,
    required this.comorbidade,
    required this.telefone,
  });

  setAgendamento(Agendamento? agendamento) {
    if(agendamento != null) {
      this.agendamento = agendamento;
      temAgendamento = true;
    } else temAgendamento = false;
  } 
}
