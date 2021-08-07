import 'package:assistente_vacinacao/models/posto_de_saude.dart';

class Agendamento {
  String data;
  String horario;
  int dose;
  PostoDeSaude posto;

  Agendamento({
    required this.data,
    required this.horario,
    required this.dose,
    required this.posto
  });
}
