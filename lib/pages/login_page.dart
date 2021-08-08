import 'package:assistente_vacinacao/components/botao.dart';
import 'package:assistente_vacinacao/components/campo_entrada.dart';
import 'package:assistente_vacinacao/components/pagina_formulario.dart';
import 'package:assistente_vacinacao/components/texto.dart';
import 'package:assistente_vacinacao/pages/cadastro_pessoa/cadastro_pessoa1_page.dart';
import 'package:assistente_vacinacao/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  final _validadorEmail = RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+(\.[a-zA-Z]+)+$"
  );

  mostraSnackBar(String mensagem) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar( content: Text(mensagem) )
    );
  }

  void fazerLogin() async {
    FocusScope.of(context).requestFocus( new FocusNode() );
    if( _formKey.currentState!.validate() ) {
      try {
        await Provider.of<AuthService>(context, listen: false).login(
          _emailController.text, _senhaController.text
        );
      } on AuthException catch (e) {
        mostraSnackBar(e.message);
      }
    }
  }

  void cadastrar() {
    FocusScope.of(context).requestFocus( new FocusNode() );
    limparCampos();
    Navigator.push(context, MaterialPageRoute(
      builder: (_) => CadastroPessoa1Page()
    ));
  }

  void limparCampos() {
    _emailController.clear();
    _senhaController.clear();
  }

  String? emailValidator(String? value) {
    if(value!.isEmpty) return 'Informe o email';
    if( !_validadorEmail.hasMatch(value) ) return 'Email inválido';
  }

  String? senhaValidator(String? value) {
    if(value!.isEmpty) return 'Informe a senha';
    if(value.length < 6) return 'A senha contém pelo menos 6 dígitos';
  }
  
  @override
  Widget build(BuildContext context) {
    return PaginaFormulario(
      formKey: _formKey,
      titulo: 'Assitente de Vacinação',
      children: [
        Texto(texto: 'Seja bem vindo ao seu assistente de vacinação!'),
        CampoEntrada(
          titulo: 'Email',
          controller: _emailController,
          keyboardType: TextInputType.emailAddress,
          validator: emailValidator,
          maxLength: 100
        ),
        CampoEntrada(
          titulo: 'Senha',
          controller: _senhaController,
          obscureText: true,
          enableSuggestions: false,
          autocorrect: false,
          validator: senhaValidator,
          maxLength: 24
        ),
        Botao(
          titulo: 'Entrar',
          onPressed: fazerLogin
        ),
        Botao(
          titulo: 'Cadastrar',
          onPressed: cadastrar,
          marginTop: 100,
        )
      ]
    );
  }
}