import 'package:assistente_vacinacao/components/botao.dart';
import 'package:assistente_vacinacao/components/campo_entrada.dart';
import 'package:assistente_vacinacao/components/pagina_formulario.dart';
import 'package:assistente_vacinacao/pages/cadastro_pessoa/cadastro_pessoa1_page.dart';
import 'package:assistente_vacinacao/pages/slider_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final cpfFormatter = MaskTextInputFormatter(
    mask: '###.###.###-##', filter: { "#": RegExp(r'[0-9]') }
  );

  void fazerLogin() {
    if( _formKey.currentState!.validate() ) {
        Navigator.push(context, MaterialPageRoute(
          builder: (_) => SliderPage()
        ));
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return PaginaFormulario(
      formKey: _formKey,
      titulo: 'Assitente de Vacinação',
      children: [
        CampoEntrada(
          titulo: 'CPF',
          enableSuggestions: false,
          autocorrect: false,
          keyboardType: TextInputType.number,
          inputFormatters: [
            cpfFormatter,
          ],
          validator: (value) {
             if(value!.isEmpty) return 'Informe o CPF';
             if( !cpfFormatter.isFill() ) return 'CPF incompleto';
          }
        ),
        CampoEntrada(
          titulo: 'Senha',
          obscureText: true,
          enableSuggestions: false,
          autocorrect: false,
          validator: (value) {
            if(value!.isEmpty) return 'Informe a senha';
            if(value.length < 6) return 'A senha contém pelo menos 6 dígitos';
          },
        ),
        Botao(
          titulo: 'Entrar',
          onPressed: fazerLogin
        ),
        Botao(
          titulo: 'Cadastrar',
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (_) => CadastroPessoa1Page()
            ));
          },
          marginTop: 148,
        )
      ]
    );
  }
}