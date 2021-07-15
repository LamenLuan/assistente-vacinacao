import 'package:assistente_vacinacao/components/botao.dart';
import 'package:assistente_vacinacao/components/campo_entrada.dart';
import 'package:assistente_vacinacao/components/pagina_formulario.dart';
import 'package:assistente_vacinacao/components/texto_formulario.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CadastroPessoa1Page extends StatefulWidget {
  CadastroPessoa1Page({Key? key}) : super(key: key);

  @override
  _CadastroPessoa1PageState createState() => _CadastroPessoa1PageState();
}

class _CadastroPessoa1PageState extends State<CadastroPessoa1Page> {
  @override
  Widget build(BuildContext context) {
    return PaginaFormulario(
      titulo: 'Parte 1 de 4',
      children: [
        TextoFormulario(texto:'Comece com seu nome completo e cpf'),
        CampoEntrada(
          titulo: 'Nome'
        ),
        CampoEntrada(
          titulo: 'CPF',
          enableSuggestions: false,
          autocorrect: false,
          keyboardType: TextInputType.number,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
          ]
        ),
        Botao(
          titulo: 'Avançar',
          onPressed: () {
            print('Jooj');
          }
        )
      ],
    );
  }
}