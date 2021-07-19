import 'package:assistente_vacinacao/components/botao.dart';
import 'package:assistente_vacinacao/components/campo_drop_down.dart';
import 'package:assistente_vacinacao/components/pagina_formulario.dart';
import 'package:assistente_vacinacao/components/texto.dart';
import 'package:assistente_vacinacao/models/agendamento.dart';
import 'package:assistente_vacinacao/models/cidadao.dart';
import 'package:assistente_vacinacao/models/posto_de_saude.dart';
import 'package:flutter/material.dart';

import '../slider_page_controller.dart';

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

  void agendar() {
    widget.cidadao.setAgendamento(
      Agendamento(
        dia: diaSelecionado!,
        horario: horarioSelecionado!,
        dose: 1,
        posto: widget.posto
      )
    );

    for (var i = 0; i < 3; i++) Navigator.pop(context);
    Navigator.push(context, MaterialPageRoute(
      builder: (_) => SliderPage(cidadao: widget.cidadao)
    ));

    FocusScope.of(context).requestFocus(new FocusNode());

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Agendamento realizado com sucesso!'))
    );
  }

  void confirmar() {
    if ( _formKey.currentState!.validate() ) {
      if (widget.cidadao.temAgendamento) {
        AlertDialog confirmacao = AlertDialog(
          title: Text('Deseja mesmo reagendar?'),
          content: Text('O agendamento anterior será cancelado.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('NÃO'),
            ),
            TextButton(
              onPressed: () {
                agendar();
                Navigator.pop(context);
              },
              child: Text('SIM'),
            ),
          ],
        );
        showDialog(context: context, builder: (context) => confirmacao);
      }
      else agendar();
    }
  }

  void onDiaChanged(String? value) {
    setState(() {
      diaSelecionado = value;
    });
  }

  void onHorarioChanged(String? value) {
    setState(() {
      horarioSelecionado = value;
    });
  }

  List<DropdownMenuItem<String>> listaDias() {
    return widget.posto.diasDisponiveis.map((String dia) {
      return DropdownMenuItem(
        value: dia,
        child: Text(dia),
      );
    }).toList();
  }

  List<DropdownMenuItem<String>> listaHorarios() {
    return widget.posto.horariosAgendamento!.map((String horario) {
      return DropdownMenuItem(
        value: horario,
        child: Text(horario),
      );
    }).toList();
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
        CampoDropDown(
          hint: 'Dia',
          value: diaSelecionado,
          onChanged: onDiaChanged,
          list: listaDias(),
          marginBottom: 24,
        ),
        CampoDropDown(
          hint: 'Horário',
          value: horarioSelecionado,
          onChanged: onHorarioChanged,
          list: listaHorarios()
        ),
        Botao(
          titulo: 'Confirmar',
          onPressed: confirmar
        )
      ],
    );
  }
}
