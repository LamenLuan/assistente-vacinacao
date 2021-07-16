import 'package:assistente_vacinacao/components/botao.dart';
import 'package:assistente_vacinacao/components/campo_entrada.dart';
import 'package:assistente_vacinacao/components/pagina_formulario.dart';
import 'package:assistente_vacinacao/components/texto_formulario.dart';
import 'package:flutter/material.dart';


class CadastroPessoa4Page extends StatefulWidget {
  CadastroPessoa4Page({Key? key}) : super(key: key);

  @override
  _CadastroPessoa4PageState createState() => _CadastroPessoa4PageState();
}

class _CadastroPessoa4PageState extends State<CadastroPessoa4Page> {
  final _formKey = GlobalKey<FormState>();
  final _senhaController = TextEditingController();

  void concluir() {
    if( _formKey.currentState!.validate() ) {
      for (var i = 0; i < 4; i++) Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return PaginaFormulario(
      formKey: _formKey,
      titulo: 'Parte 4 de 4',
      children: [
        TextoFormulario(
          texto:'Por último, informe sua senha, lembre de anotá-la em algum ' +
          'lugar seguro'
        ),
        CampoEntrada(
          titulo: 'Senha',
          obscureText: true,
          enableSuggestions: false,
          autocorrect: false,
          controller: _senhaController,
          validator: (value) {
            if(value!.isEmpty) return 'Informe a senha';
            if(value.length < 6) return 'A senha contém pelo menos 6 dígitos';
          }
        ),
        CampoEntrada(
          titulo: 'Confirmar sua senha',
          obscureText: true,
          enableSuggestions: false,
          autocorrect: false,
          validator: (value) {
            if(value!.isEmpty) return 'Informe novamente a senha';
            if(value != _senhaController.text) return 'Senhas não são iguais';
          }
        ),
        Botao(
          titulo: 'Concluir',
          onPressed: concluir
        )
      ],
    );
  }
}