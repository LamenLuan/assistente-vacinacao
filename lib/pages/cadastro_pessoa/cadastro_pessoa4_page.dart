import 'package:assistente_vacinacao/components/botao.dart';
import 'package:assistente_vacinacao/components/campo_entrada.dart';
import 'package:assistente_vacinacao/components/pagina_formulario.dart';
import 'package:assistente_vacinacao/components/texto.dart';
import 'package:assistente_vacinacao/models/cidadao.dart';
import 'package:assistente_vacinacao/repositories/cidadao_repository.dart';
import 'package:flutter/material.dart';


class CadastroPessoa4Page extends StatefulWidget {
  final Cidadao cidadao;

  CadastroPessoa4Page({Key? key, required this.cidadao}) : super(key: key);

  @override
  _CadastroPessoa4PageState createState() => _CadastroPessoa4PageState();
}

class _CadastroPessoa4PageState extends State<CadastroPessoa4Page> {
  final _senhaController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void concluir() {
    if( _formKey.currentState!.validate() ) {
      Cidadao cidadao = widget.cidadao;
      cidadao.senha = _senhaController.text;
      CidadaoRepository.cidadaos.add(cidadao);
      
      for (var i = 0; i < 4; i++) Navigator.pop(context);
      
      FocusScope.of(context).requestFocus( new FocusNode() );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar( content: Text('Cadastro realizado com sucesso!') )
      );
    }
  }

  String? senhaValidator(String? value) {
    if(value!.isEmpty) return 'Informe a senha';
    if(value.length < 6) return 'A senha deve conter pelo menos 6 dígitos';
  }

  String? confirmacaoSenhaValidator(String? value) {
    if(value!.isEmpty) return 'Informe novamente a senha';
    if(value != _senhaController.text) return 'Senhas não são iguais';
  }

  @override
  Widget build(BuildContext context) {
    return PaginaFormulario(
      formKey: _formKey,
      titulo: 'Parte 4 de 4',
      children: [
        Texto(
          texto:'Por último, informe sua senha, lembre-se de anotá-la em algum '
          + 'lugar seguro'
        ),
        CampoEntrada(
          titulo: 'Senha',
          obscureText: true,
          enableSuggestions: false,
          autocorrect: false,
          controller: _senhaController,
          validator: senhaValidator
        ),
        CampoEntrada(
          titulo: 'Confirmar sua senha',
          obscureText: true,
          enableSuggestions: false,
          autocorrect: false,
          validator: confirmacaoSenhaValidator
        ),
        Botao(
          titulo: 'Concluir',
          onPressed: concluir
        )
      ],
    );
  }
}