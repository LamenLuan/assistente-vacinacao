import 'package:assistente_vacinacao/components/botao_com_icone.dart';
import 'package:assistente_vacinacao/components/texto.dart';
import 'package:assistente_vacinacao/models/cidadao.dart';
import 'package:assistente_vacinacao/pages/agendamento/agendamento_page_pt1.dart';
import 'package:flutter/material.dart';

class PrincipalPage extends StatefulWidget {
  final Cidadao cidadao;
  PrincipalPage({Key? key, required this.cidadao}) : super(key: key);

  @override
  _PrincipalPageState createState() => _PrincipalPageState();
}

class _PrincipalPageState extends State<PrincipalPage> {
  void agendar() {
    Cidadao cidadao = widget.cidadao;

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => AgendamentoPagePt1(cidadao: cidadao)));
  }

  String? verificaAgendamento1(Cidadao cidadao) {
    if (cidadao.temAgendamento)
      return 'Aplicação da ${cidadao.agendamento.dose}ª dose!';
    else
      return 'Você ainda não possui um agendamento';
  }

  String? verificaAgendamento2(Cidadao cidadao) {
    if (cidadao.temAgendamento)
      return '${cidadao.agendamento.posto.nome}\n\n' +
          'Endereço: ${cidadao.agendamento.posto.endereco}';
    else
      return 'Marque um agendamento clicando no ícone de calendário abaixo';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Assistente de Vacinação'),
        centerTitle: true
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          Texto(
            texto: 'Bem vindo ${widget.cidadao.nome}!',
            marginTop: 20,
            marginBottom: 20,
          ),
          Texto(
            texto: verificaAgendamento1(widget.cidadao)!,
            marginTop: 20,
            marginBottom: 20,
          ),
          Texto(
            texto: verificaAgendamento2(widget.cidadao)!,
            marginTop: 20,
            marginBottom: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: (widget.cidadao.temAgendamento) ?
            [
              BotaoIcone(
                titulo: 'Cancelar',
                onPressed: () {},
                icone: Icons.cancel_outlined,
              ),
              Padding(
                padding: EdgeInsets.all(16),
              ),
              BotaoIcone(
                titulo: 'Rotas',
                onPressed: () {},
                icone: Icons.map_rounded,
              ),
            ] : [],
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: agendar,
        child: Icon(Icons.calendar_today_rounded),
      ),
    );
  }
}
