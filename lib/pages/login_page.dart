import 'package:assistente_vacinacao/components/botao.dart';
import 'package:assistente_vacinacao/components/campo_entrada.dart';
import 'package:assistente_vacinacao/components/pagina_formulario.dart';
import 'package:assistente_vacinacao/components/texto.dart';
import 'package:assistente_vacinacao/models/cidadao.dart';
import 'package:assistente_vacinacao/pages/cadastro_pessoa/cadastro_pessoa1_page.dart';
import 'package:assistente_vacinacao/pages/slider_page_controller.dart';
import 'package:assistente_vacinacao/repositories/cidadao_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final _cpfController = TextEditingController();
  final _senhaController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  final _cpfFormatter = MaskTextInputFormatter(
    mask: '###.###.###-##', filter: { "#": RegExp(r'[0-9]') }
  );

  Cidadao? encontrado;

  void fazerLogin() {
    if( _formKey.currentState!.validate() ) {
      Cidadao cidadao = encontrado!;
      
      limparCampos();
      Navigator.push(context, MaterialPageRoute(
        builder: (_) => SliderPage(cidadao: cidadao)
      ));
    }
  }

  void cadastrar() {
    limparCampos();
    Navigator.push(context, MaterialPageRoute(
      builder: (_) => CadastroPessoa1Page()
    ));
  }

  void limparCampos() {
    _cpfController.clear();
    _senhaController.clear();
  }

  String? cpfValidator(String? value) {
    if(value!.isEmpty) return 'Informe o CPF';
    if( !_cpfFormatter.isFill() ) return 'CPF incompleto';
  }

  String? senhaValidator(String? value) {
    if(value!.isEmpty) return 'Informe a senha';
    if(value.length < 6) return 'A senha contém pelo menos 6 dígitos';

    encontrado = CidadaoRepository.findCidadao(_cpfController.text);
    if(encontrado == null || encontrado!.senha != value)
      return 'Dados incorretos, verifique CPF e senha';
  }
  
  @override
  Widget build(BuildContext context) {
    return PaginaFormulario(
      formKey: _formKey,
      titulo: 'Assitente de Vacinação',
      children: [
        Texto(texto: 'Seja bem vindo ao seu assistente de vacinação!'),
        CampoEntrada(
          titulo: 'CPF',
          controller: _cpfController,
          enableSuggestions: false,
          autocorrect: false,
          keyboardType: TextInputType.number,
          inputFormatters: [_cpfFormatter],
          validator: cpfValidator
        ),
        CampoEntrada(
          titulo: 'Senha',
          controller: _senhaController,
          obscureText: true,
          enableSuggestions: false,
          autocorrect: false,
          validator: senhaValidator,
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