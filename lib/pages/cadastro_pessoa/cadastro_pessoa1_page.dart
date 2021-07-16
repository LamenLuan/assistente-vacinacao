import 'package:assistente_vacinacao/components/botao.dart';
import 'package:assistente_vacinacao/components/campo_entrada.dart';
import 'package:assistente_vacinacao/components/pagina_formulario.dart';
import 'package:assistente_vacinacao/components/texto_formulario.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import 'cadastro_pessoa2_page.dart';

class CadastroPessoa1Page extends StatefulWidget {
  CadastroPessoa1Page({Key? key}) : super(key: key);

  @override
  _CadastroPessoa1PageState createState() => _CadastroPessoa1PageState();
}

class _CadastroPessoa1PageState extends State<CadastroPessoa1Page> {
  final _formKey = GlobalKey<FormState>();
  final cpfFormatter = MaskTextInputFormatter(
    mask: '###.###.###-##', filter: { "#": RegExp(r'[0-9]') }
  );

  void prosseguir() {
    if( _formKey.currentState!.validate() ) {
      Navigator.push(context, MaterialPageRoute(
        builder: (_) => CadastroPessoa2Page()
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return PaginaFormulario(
      formKey: _formKey,
      titulo: 'Parte 1 de 4',
      children: [
        TextoFormulario(texto:'Comece com seu nome completo e cpf'),
        CampoEntrada(
          titulo: 'Nome',
          keyboardType: TextInputType.name,
          validator: (value) {
             if(value!.trim().isEmpty) return 'Informe o nome completo';
          }
        ),
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
        Botao(
          titulo: 'Avançar',
          onPressed: prosseguir
        )
      ],
    );
  }
}