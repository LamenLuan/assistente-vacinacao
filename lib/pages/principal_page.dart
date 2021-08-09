import 'package:assistente_vacinacao/components/botao_com_icone.dart';
import 'package:assistente_vacinacao/components/texto.dart';
import 'package:assistente_vacinacao/models/agendamento.dart';
import 'package:assistente_vacinacao/models/usuario.dart';
import 'package:assistente_vacinacao/repositories/posto_de_saude_repository.dart';
import 'package:assistente_vacinacao/repositories/usuarios_repository.dart';
import 'package:assistente_vacinacao/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'agendamento/agendamento_page_pt1.dart';

class PrincipalPage extends StatefulWidget {
  PrincipalPage({Key? key}) : super(key: key);

  @override
  _PrincipalPageState createState() => _PrincipalPageState();
}

class _PrincipalPageState extends State<PrincipalPage> {

  Usuario? usuario;

  void agendar() {
    if(usuario != null) {
      Usuario usuario = this.usuario!;
      Navigator.push(context, MaterialPageRoute(
        builder: (_) => AgendamentoPagePt1(usuario: usuario)
      ));
    }
  }

  void cancelarAgendamento() {
    AlertDialog confirmacao = AlertDialog(
      title: Text('Deseja mesmo cancelar?'),
      content: Text('Esta ação não pode ser revertida.'),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text('NÃO'),
        ),
        TextButton(
          onPressed: () {
            Agendamento agendamento = usuario!.agendamento;
            // Removo o agendamento do banco
            Provider.of<UsuariosRepository>(
              context, listen: false
            ).cancelaAgendamento();
            // Devolvo a dose no posto, tanto em memoria quanto em banco
            Provider.of<PostoDeSaudeRepository>(
              context, listen: false
            ).devolveDose(agendamento.nomePosto, agendamento.data);

            Navigator.pop(context);
          },
          child: Text('SIM'),
        ),
      ],
    );
    showDialog(context: context, builder: (context) => confirmacao);
  }

  String? agendamento(Usuario usuario) {
    if (usuario.temAgendamento)
      return 'Agendada: Aplicação da ${usuario.agendamento.dose}ª dose';
    else
      return 'Você ainda não possui um agendamento 📅';
  }

  String? postoEndereco(Usuario usuario) {
    if (usuario.temAgendamento)
      return '${usuario.agendamento.nomePosto}\n\n' +
          '${usuario.agendamento.endereco}';
    else
      return 'Marque um agendamento clicando no ícone de calendário abaixo 👇';
  }

  String? data(Usuario usuario) {
    if (usuario.temAgendamento) return '${usuario.agendamento.data}';
    else return '';
  }

  @override
  Widget build(BuildContext context) {

    usuario = Provider.of<UsuariosRepository>(context).autenticado;

    return Scaffold(
      appBar: AppBar(
        title: Text('Assistente de Vacinação'),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.logout),
          onPressed: () async => await Provider.of<AuthService>(
            context, listen: false
          ).logout()
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: (usuario != null) ? [
          Texto(
            texto: 'Bem vindo ${usuario!.nome}!',
            marginTop: 20,
            marginBottom: 20,
          ),
          Texto(
            texto: agendamento(usuario!)!,
            marginTop: 20,
            marginBottom: 20,
          ),
          Texto(
            texto: postoEndereco(usuario!)!,
            marginTop: 20,
            marginBottom: 20,
          ),
          Texto(
            texto: data(usuario!)!,
            marginTop: 20,
            marginBottom: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: (usuario!.temAgendamento) ?
            [
              BotaoIcone(
                titulo: 'Cancelar',
                onPressed: cancelarAgendamento,
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
        ] : [],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: agendar,
        child: Icon(Icons.calendar_today_rounded),
        backgroundColor: Colors.teal[400]
      ),
    );
  }
}
