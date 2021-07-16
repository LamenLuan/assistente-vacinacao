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
  @override
  Widget build(BuildContext context) {
    return PaginaFormulario(
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
          autocorrect: false
        ),
        CampoEntrada(
          titulo: 'Confirmar sua senha',
          obscureText: true,
          enableSuggestions: false,
          autocorrect: false
        ),
        Botao(
          titulo: 'Avançar',
          onPressed: () {
            
          }
        )
      ],
    );
  }
}