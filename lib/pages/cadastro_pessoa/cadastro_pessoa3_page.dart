import 'package:assistente_vacinacao/components/botao.dart';
import 'package:assistente_vacinacao/components/campo_entrada.dart';
import 'package:assistente_vacinacao/components/pagina_formulario.dart';
import 'package:assistente_vacinacao/components/texto_formulario.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import 'cadastro_pessoa4_page.dart';

class CadastroPessoa3Page extends StatefulWidget {
  CadastroPessoa3Page({Key? key}) : super(key: key);

  @override
  _CadastroPessoa3PageState createState() => _CadastroPessoa3PageState();
}

class _CadastroPessoa3PageState extends State<CadastroPessoa3Page> {
  final _formKey = GlobalKey<FormState>();
  final telefoneFormatter = MaskTextInputFormatter(
    mask: '(##) #####-####', filter: { "#": RegExp(r'[0-9]') }
  );
  final validadorEmail = RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+"
  );

  void prosseguir() {
    if( _formKey.currentState!.validate() ) {
      Navigator.push(context, MaterialPageRoute(
        builder: (_) => CadastroPessoa4Page()
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return PaginaFormulario(
      formKey: _formKey,
      titulo: 'Parte 3 de 4',
      children: [
        TextoFormulario(texto:'Agora suas informações de contato'),
        CampoEntrada(
          titulo: 'Telefone',
          keyboardType: TextInputType.phone,
          inputFormatters: [
            telefoneFormatter,
          ],
          validator: (value) {
             if(value!.isEmpty) return 'Informe o telefone';
             if( !telefoneFormatter.isFill() ) return 'Telefone incompleto';
          }
        ),
        CampoEntrada(
          titulo: 'Email (Opcional)',
          keyboardType: TextInputType.emailAddress,
          validator: (value) {
              if(value!.isNotEmpty && !validadorEmail.hasMatch(value) ) 
                return 'Email incompleto';
          }
        ),
        Botao(
          titulo: 'Avançar',
          onPressed: prosseguir
        )
      ],
    );
  }
}