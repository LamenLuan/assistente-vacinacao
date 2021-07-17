import 'package:assistente_vacinacao/components/botao_com_icone.dart';
import 'package:assistente_vacinacao/components/texto.dart';
import 'package:flutter/material.dart';

class PrincipalPage extends StatefulWidget {
  PrincipalPage({Key? key}) : super(key: key);

  @override
  _PrincipalPageState createState() => _PrincipalPageState();
}

class _PrincipalPageState extends State<PrincipalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Assistente de Vacinação'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          Texto(
            texto: 'Bem vindo Fulano!',
            marginTop: 20,
            marginBottom: 20,
          ),
          Texto(
            texto: 'Agendado:',
            marginTop: 20,
            marginBottom: 20,
          ),
          Texto(
            texto: 'Aplicação da primeira dose\nRua Coronel Fulano de Tal, 1441, Ala B\n23/07/2021 - 14:30',
            marginTop: 20,
            marginBottom: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
            ],
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.calendar_today_rounded),
      ),
    );
  }
}
