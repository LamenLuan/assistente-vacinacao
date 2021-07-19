import 'package:assistente_vacinacao/components/botao.dart';
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

  List<String>? nomesPostos = [];
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

  void inicializaLista() {
    if (nomesPostos!.isEmpty) {
      PostoDeSaudeRepository.postos.forEach((posto) {
        nomesPostos!.add(posto.nome);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    inicializaLista();
    return PaginaFormulario(
      formKey: _formKey,
      titulo: 'Parte 1 de 2',
      children: [
        Texto(
          texto: 'Selecione em qual unidade gostaria de agendar',
          marginBottom: 24,
        ),
        Center(
          child: DropdownButtonFormField(
            isExpanded: true,
            hint: Text('Local'),
            onChanged: (String? novoLocal) {
              setState(() {
                localSelecionado = novoLocal!;
              });
            },
            items: nomesPostos!.map((String local) {
              return DropdownMenuItem(
                value: local,
                child: Text(local),
              );
            }).toList(),
            value: localSelecionado,
            validator: (value) => value == null ? 'Campo obrigatório' : null,
          ),
        ),
        Botao(
          titulo: 'Avançar',
          onPressed: prosseguir,
        ),
      ],
    );
  }
}
