import 'package:assistente_vacinacao/models/dia_vacinacao.dart';

class PostoDeSaude {
  String nome;
  String endereco;
  List<DiaVacinacao> diasDisponiveis;

  PostoDeSaude({
    required this.nome,
    required this.endereco,
    required this.diasDisponiveis,
  });

  bool cancelaAgendamento(String data, String horarioEscolhido) {
    for (var dia in diasDisponiveis) {
      if(dia.data == data) {
        for (var horario in dia.horarios.keys) {
          if(horario == horarioEscolhido) {
            dia.horarios.update(horario, (value) => ++value);
            return true;
          }
        }
      }
    }
    return false;
  }
}
