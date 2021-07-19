import 'package:assistente_vacinacao/components/botao.dart';
import 'package:assistente_vacinacao/components/pagina_formulario.dart';
import 'package:assistente_vacinacao/components/texto.dart';
import 'package:assistente_vacinacao/models/agendamento.dart';
import 'package:assistente_vacinacao/models/cidadao.dart';
import 'package:assistente_vacinacao/models/posto_de_saude.dart';
import 'package:flutter/material.dart';

class AgendamentoPagePt2 extends StatefulWidget {
  final Cidadao cidadao;
  final PostoDeSaude posto;

  AgendamentoPagePt2({
    Key? key,
    required this.cidadao,
    required this.posto,
  }) : super(key: key);

  @override
  _AgendamentoPagePt2State createState() => _AgendamentoPagePt2State();
}

class _AgendamentoPagePt2State extends State<AgendamentoPagePt2> {
  String? diaSelecionado;
  String? horarioSelecionado;
  final _formKey = GlobalKey<FormState>();

  void confirmar() {
    if ( _formKey.currentState!.validate() ) {

      widget.cidadao.setAgendamento(
        Agendamento(
          dia: diaSelecionado!,
          horario: horarioSelecionado!,
          dose: 1,
          posto: widget.posto
        )
      );

      for (var i = 0; i < 2; i++) Navigator.pop(context);

      FocusScope.of(context).requestFocus(new FocusNode());

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Agendamento realizado com sucesso!'))
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return PaginaFormulario(
      formKey: _formKey,
      titulo: 'Parte 2 de 2',
      children: [
        Texto(
          texto: 'Agora escolha o dia e um dos horários disponíveis ' +
            'para a vacinação',
          marginBottom: 24,
        ),
        DropdownButtonFormField(
          isExpanded: true,
          hint: Text('Dia'),
          onChanged: (String? diaAgendamento) {
            setState(() {
              diaSelecionado = diaAgendamento!;
            });
          },
          items: widget.posto.diasDisponiveis.map((String dia) {
            return DropdownMenuItem(
              value: dia,
              child: Text(dia),
            );
          }).toList(),
          value: diaSelecionado,
          validator: (value) => value == null ? 'Campo obrigatório' : null,
        ),
        DropdownButtonFormField(
          isExpanded: true,
          hint: Text('Horário'),
          onChanged: (String? horarioAgendamento) {
            setState(() {
              horarioSelecionado = horarioAgendamento!;
            });
          },
          items: widget.posto.horariosAgendamento!.map((String horario) {
            return DropdownMenuItem(
              value: horario,
              child: Text(horario),
            );
          }).toList(),
          value: horarioSelecionado,
          validator: (value) => value == null ? 'Campo obrigatório' : null,
        ),
        Botao(titulo: 'Confirmar', onPressed: confirmar)
      ],
    );
  }
}
