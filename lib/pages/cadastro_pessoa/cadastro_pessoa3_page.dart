import 'package:assistente_vacinacao/components/botao.dart';
import 'package:assistente_vacinacao/components/campo_entrada.dart';
import 'package:assistente_vacinacao/components/pagina_formulario.dart';
import 'package:assistente_vacinacao/components/texto.dart';
import 'package:assistente_vacinacao/models/cidadao.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import 'cadastro_pessoa4_page.dart';

class CadastroPessoa3Page extends StatefulWidget {
  final Cidadao cidadao;
  
  CadastroPessoa3Page({Key? key, required this.cidadao}) : super(key: key);

  @override
  _CadastroPessoa3PageState createState() => _CadastroPessoa3PageState();
}

class _CadastroPessoa3PageState extends State<CadastroPessoa3Page> {
  final _telefoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  final _telefoneFormatter = MaskTextInputFormatter(
    mask: '(##) #####-####', filter: { "#": RegExp(r'[0-9]') }
  );
  final _validadorEmail = RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"
  );

  void prosseguir() {
    if( _formKey.currentState!.validate() ) {
      Cidadao cidadao = widget.cidadao;
      cidadao.telefone = _telefoneController.text;
      if(_emailController.text.isNotEmpty)
        cidadao.email = _emailController.text;

      Navigator.push(context, MaterialPageRoute(
        builder: (_) => CadastroPessoa4Page(cidadao: widget.cidadao)
      ));
    }
  }

  String? telefoneValidator(String? value) {
    if(value!.isEmpty) return 'Informe o telefone';
    if( !_telefoneFormatter.isFill() ) return 'Telefone incompleto';
  }

  String? emailValidator(String? value) {
    if(value!.isNotEmpty && !_validadorEmail.hasMatch(value) )
      return 'Email incompleto';
  }

  @override
  Widget build(BuildContext context) {
    return PaginaFormulario(
      formKey: _formKey,
      titulo: 'Parte 3 de 4',
      children: [
        Texto(texto:'Agora suas informações de contato'),
        CampoEntrada(
          titulo: 'Telefone',
          controller: _telefoneController,
          keyboardType: TextInputType.phone,
          inputFormatters: [_telefoneFormatter],
          validator: telefoneValidator
        ),
        CampoEntrada(
          titulo: 'Email (Opcional)',
          controller: _emailController,
          keyboardType: TextInputType.emailAddress,
          validator: emailValidator
        ),
        Botao(
          titulo: 'Avançar',
          onPressed: prosseguir
        )
      ],
    );
  }
}