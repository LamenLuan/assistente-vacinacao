import 'package:assistente_vacinacao/components/botao.dart';
import 'package:assistente_vacinacao/components/campo_drop_down.dart';
import 'package:assistente_vacinacao/components/pagina_formulario.dart';
import 'package:assistente_vacinacao/components/texto.dart';
import 'package:assistente_vacinacao/models/agendamento.dart';
import 'package:assistente_vacinacao/models/usuario.dart';
import 'package:assistente_vacinacao/models/dia_vacinacao.dart';
import 'package:assistente_vacinacao/models/posto_de_saude.dart';
import 'package:flutter/material.dart';

class AgendamentoPagePt2 extends StatefulWidget {
  final Usuario cidadao;
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
  DiaVacinacao? diaSelecionado;
  String? dataSelecionada;
  String? horarioSelecionado;
  final _formKey = GlobalKey<FormState>();

  void agendar() {
    
    widget.cidadao.setAgendamento(
      Agendamento(
        data: diaSelecionado!.data,
        horario: horarioSelecionado!.toString(),
        dose: 1,
        posto: widget.posto
      )
    );

    diaSelecionado!.horarios.update(
      horarioSelecionado!, (value) => --value
    );

    horarioSelecionado = null;

    for (var i = 0; i < 3; i++) Navigator.pop(context);
    // Navigator.push(context, MaterialPageRoute(
    //   builder: (_) => SliderPage()
    // ));

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
    for (var dia in widget.posto.diasDisponiveis) {
      if(dia.data == value) {
        setState(() {
          diaSelecionado = dia;
          dataSelecionada = dia.data;
          horarioSelecionado = null;
        });
        break;
      }
    }
  }

  void onHorarioChanged(String? value) {
    setState(() {
      horarioSelecionado = value;
    });
  }

  List<DropdownMenuItem<String>> listaDias() {
    List<DropdownMenuItem<String>> dias = [];

    widget.posto.diasDisponiveis.forEach(
      (element) => dias.add(DropdownMenuItem<String>(
        value: element.data,
        child: Text(element.data),
      ))
    );

    return dias;
  }

  List<DropdownMenuItem<String>> listaHorarios() {
    List<DropdownMenuItem<String>> horarios = [];

    if (diaSelecionado != null) {
      diaSelecionado!.horarios.forEach( (key, value) {
        if(value > 0) {
          horarios.add(DropdownMenuItem<String>(
            value: key,
            child: Text(key),
          ));
        }
      });
    }

    return horarios;
  }

  @override
  Widget build(BuildContext context) {
    return PaginaFormulario(
      formKey: _formKey,
      titulo: 'Parte 2 de 2',
      children: [
        Texto(
          texto: 'Agora escolha a data e um dos horários disponíveis ' +
            'para a vacinação',
          marginBottom: 24,
        ),
        CampoDropDown(
          hint: 'Data',
          value: dataSelecionada,
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
