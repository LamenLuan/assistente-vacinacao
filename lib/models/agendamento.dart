import 'package:assistente_vacinacao/models/posto_de_saude.dart';

class Agendamento {
  String dia;
  String horario;
  int dose;
  PostoDeSaude posto;

  Agendamento({
    required this.dia,
    required this.horario,
    required this.dose,
    required this.posto
  });
}
