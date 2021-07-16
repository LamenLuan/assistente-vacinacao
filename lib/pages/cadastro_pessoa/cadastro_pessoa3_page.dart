import 'package:assistente_vacinacao/components/botao.dart';
import 'package:assistente_vacinacao/components/campo_entrada.dart';
import 'package:assistente_vacinacao/components/pagina_formulario.dart';
import 'package:assistente_vacinacao/components/texto_formulario.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'cadastro_pessoa4_page.dart';

class CadastroPessoa3Page extends StatefulWidget {
  CadastroPessoa3Page({Key? key}) : super(key: key);

  @override
  _CadastroPessoa3PageState createState() => _CadastroPessoa3PageState();
}

class _CadastroPessoa3PageState extends State<CadastroPessoa3Page> {
  @override
  Widget build(BuildContext context) {
    return PaginaFormulario(
      titulo: 'Parte 3 de 4',
      children: [
        TextoFormulario(texto:'Agora suas informações de contato'),
        CampoEntrada(
          titulo: 'Telefone',
          keyboardType: TextInputType.phone,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
          ]
        ),
        CampoEntrada(
          titulo: 'Email (Opcional)',
          keyboardType: TextInputType.emailAddress,
        ),
        Botao(
          titulo: 'Avançar',
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (_) => CadastroPessoa4Page()
            ));
          }
        )
      ],
    );
  }
}