import 'package:assistente_vacinacao/models/posto_de_saude.dart';

class Agendamento {
  late PostoDeSaude posto;
  String dia;
  String horario;
  int dose;

  Agendamento({
    required this.dia,
    required this.horario,
    required this.dose,
  });

  setPosto(PostoDeSaude posto) => this.posto = posto;
}
