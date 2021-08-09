import 'package:assistente_vacinacao/components/botao.dart';
import 'package:assistente_vacinacao/components/campo_drop_down.dart';
import 'package:assistente_vacinacao/components/pagina_formulario.dart';
import 'package:assistente_vacinacao/components/texto.dart';
import 'package:assistente_vacinacao/models/agendamento.dart';
import 'package:assistente_vacinacao/models/usuario.dart';
import 'package:assistente_vacinacao/models/posto_de_saude.dart';
import 'package:assistente_vacinacao/repositories/usuarios_repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AgendamentoPagePt2 extends StatefulWidget {
  final Usuario usuario;
  final PostoDeSaude posto;

  AgendamentoPagePt2({
    Key? key,
    required this.usuario,
    required this.posto,
  }) : super(key: key);

  @override
  _AgendamentoPagePt2State createState() => _AgendamentoPagePt2State();
}

class _AgendamentoPagePt2State extends State<AgendamentoPagePt2> {
  String? dataSelecionada;
  final _formKey = GlobalKey<FormState>();

  void agendar() async {
    
    await Provider.of<UsuariosRepository>(
          context, listen: false
    ).saveAgendamento(Agendamento(
        data: dataSelecionada!,
        dose: 1,
        endereco: widget.posto.endereco,
        nomePosto: widget.posto.nome
    ));

    for (var i = 0; i < 2; i++) Navigator.pop(context);
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
      if (widget.usuario.temAgendamento) {
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
      dataSelecionada = value;
    });
  }

  List<DropdownMenuItem<String>> listaDias() {
    List<DropdownMenuItem<String>> dias = [];
    widget.posto.diasDisponiveis.forEach( (key, value) {
        if(value > 0) {
          dias.add(DropdownMenuItem<String>(
            value: key,
            child: Text(key),
          ));
        }
      }
    );
    return dias;
  }

  @override
  Widget build(BuildContext context) {
    return PaginaFormulario(
      formKey: _formKey,
      titulo: 'Parte 2 de 2',
      children: [
        Texto(
          texto: 'Agora escolha a data para a vacinação',
          marginBottom: 24,
        ),
        CampoDropDown(
          hint: 'Data',
          value: dataSelecionada,
          onChanged: onDiaChanged,
          list: listaDias(),
          marginBottom: 24,
        ),
        Botao(
          titulo: 'Confirmar',
          onPressed: confirmar
        )
      ],
    );
  }
}
