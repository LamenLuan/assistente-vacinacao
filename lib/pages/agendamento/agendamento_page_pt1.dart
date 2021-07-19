import 'package:assistente_vacinacao/components/botao.dart';
import 'package:assistente_vacinacao/components/campo_drop_down.dart';
import 'package:assistente_vacinacao/components/pagina_formulario.dart';
import 'package:assistente_vacinacao/components/texto.dart';
import 'package:assistente_vacinacao/models/cidadao.dart';
import 'package:assistente_vacinacao/models/posto_de_saude.dart';
import 'package:assistente_vacinacao/pages/agendamento/agendamento_page_pt2.dart';
import 'package:assistente_vacinacao/repositories/posto_de_saude_repository.dart';
import 'package:flutter/material.dart';

class AgendamentoPagePt1 extends StatefulWidget {
  final Cidadao cidadao;

  AgendamentoPagePt1({Key? key, required this.cidadao}) : super(key: key);

  @override
  _AgendamentoPagePt1State createState() => _AgendamentoPagePt1State();
}

class _AgendamentoPagePt1State extends State<AgendamentoPagePt1> {
  final _formKey = GlobalKey<FormState>();
  String? localSelecionado;

  void prosseguir() {
    if ( _formKey.currentState!.validate() ) {
      PostoDeSaude? posto = PostoDeSaudeRepository.findPosto(localSelecionado!);

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => AgendamentoPagePt2(
            cidadao: widget.cidadao,
            posto: posto!,
          )
        )
      );
    }
  }

  void onLocalChanged(String? value) {
    setState(() {
      localSelecionado = value!;
    });
  }

  List<DropdownMenuItem<String>> listaNomesPostos() {
    return PostoDeSaudeRepository.postos.map((PostoDeSaude posto) {
      return DropdownMenuItem(
        value: posto.nome,
        child: Text(posto.nome),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return PaginaFormulario(
      formKey: _formKey,
      titulo: 'Parte 1 de 2',
      children: [
        Texto(
          texto: 'Selecione em qual unidade gostaria de agendar',
          marginBottom: 24,
        ),
        CampoDropDown(
          hint: 'Local',
          value: localSelecionado,
          onChanged: onLocalChanged,
          list: listaNomesPostos()
        ),
        Botao(
          titulo: 'Avançar',
          onPressed: prosseguir,
        ),
      ],
    );
  }
}
