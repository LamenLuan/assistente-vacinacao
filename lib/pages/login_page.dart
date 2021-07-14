import 'package:assistente_vacinacao/components/botao.dart';
import 'package:assistente_vacinacao/components/campo_entrada.dart';
import 'package:assistente_vacinacao/pages/cadastro_page.dart';
import 'package:assistente_vacinacao/pages/principal_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Assistente de Vacinação'),
        centerTitle: true
      ),
      body: Form(
        child: Padding(
          padding: const EdgeInsets.all(48),
          child: Column(
            children: [
              CampoEntrada(
                titulo: 'CPF',
              ),
              CampoEntrada(
                titulo: 'Senha',
              ),
              Botao(
                titulo: 'Entrar',
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (_) => PrincipalPage()
                  ));
                }
              ),
              Botao(
                titulo: 'Cadastrar',
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (_) => CadastroPage()
                  ));
                }
              )
            ],
          ),
        )
      )
    );
  }
}