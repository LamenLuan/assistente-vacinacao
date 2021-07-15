import 'package:assistente_vacinacao/components/botao.dart';
import 'package:assistente_vacinacao/components/campo_entrada.dart';
import 'package:assistente_vacinacao/components/pagina_formulario.dart';
import 'package:assistente_vacinacao/pages/cadastro_pessoa/cadastro_pessoa1_page.dart';
import 'package:assistente_vacinacao/pages/principal_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  
  @override
  Widget build(BuildContext context) {
    return PaginaFormulario(
      titulo: 'Assitente de Vacinação',
      children: [
        CampoEntrada(
          titulo: 'CPF',
          enableSuggestions: false,
          autocorrect: false,
          keyboardType: TextInputType.number,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
          ],
        ),
        CampoEntrada(
          titulo: 'Senha',
          obscureText: true,
          enableSuggestions: false,
          autocorrect: false,
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
              builder: (_) => CadastroPessoa1Page()
            ));
          }
        )
      ]
    );
  }
}