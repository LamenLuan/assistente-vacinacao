import 'package:assistente_vacinacao/components/botao.dart';
import 'package:assistente_vacinacao/components/pagina_formulario.dart';
import 'package:assistente_vacinacao/components/texto_formulario.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'cadastro_pessoa3_page.dart';

class CadastroPessoa2Page extends StatefulWidget {
  CadastroPessoa2Page({Key? key}) : super(key: key);

  @override
  _CadastroPessoa2PageState createState() => _CadastroPessoa2PageState();
}

class _CadastroPessoa2PageState extends State<CadastroPessoa2Page> {
  bool isMasculino = true, isComorbidade = false;
  final _formKey = GlobalKey<FormState>();
  final _dataController = TextEditingController();

  Future selecionaData() async {
    FocusScope.of(context).requestFocus( new FocusNode() );
    final DateFormat formatter = DateFormat('dd/MM/yyyy');

    DateTime? selecionada = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(1900),
      lastDate: new DateTime.now()
    );

    if(selecionada != null) setState(
      () => _dataController.value = TextEditingValue(
        text: formatter.format(selecionada)
      )
    );
  }

  void onGeneroChanged(bool? valor)
  {
    setState(() {
      isMasculino = valor!;
    });
  }

  void onComorbidadeChanged(bool? valor)
  {
    setState(() {
      isComorbidade = valor!;
    });
  }

  void prosseguir() {
    if( _formKey.currentState!.validate() ) {
      Navigator.push(context, MaterialPageRoute(
        builder: (_) => CadastroPessoa3Page()
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return PaginaFormulario(
      key: _formKey,
      titulo: 'Parte 2 de 4',
      children: [
        TextoFormulario(
          texto:'Insira sua data de nascimento e seus dados físicos',
          marginBottom: 24,
        ),
        TextFormField(
          controller: _dataController,
          style: TextStyle(
            fontSize: 22
          ),
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Data de nascimento',
          ),
          onTap: selecionaData,
          validator: (value) {
            if(value!.isEmpty) return 'Informe a data de nascimento';
          },
        ),
        Row(
          children: [
            TextoFormulario(
              texto: 'Gênero:',
              marginTop: 24,
            )
          ]
        ),
        Row(
          children: [
            Radio(
              value: true,
              groupValue: isMasculino,
              onChanged: onGeneroChanged,
            ),
            Text( 'Masculino', style: TextStyle(fontSize: 20) ),
            Radio(
              value: false,
              groupValue: isMasculino,
              onChanged: onGeneroChanged
            ),
            Text( 'Feminino', style: TextStyle(fontSize: 20) ),
          ],
        ),
        Row(
          children: [
            TextoFormulario(
              texto: 'Comorbidade?',
              marginTop: 12,
            )
          ]
        ),
        Row(
          children: [
            Radio(
              value: true,
              groupValue: isComorbidade,
              onChanged: onComorbidadeChanged,
            ),
            Text( 'Sim', style: TextStyle(fontSize: 20) ),
            Radio(
              value: false,
              groupValue: isComorbidade,
              onChanged: onComorbidadeChanged
            ),
            Text( 'Não', style: TextStyle(fontSize: 20) ),
          ],
        ),
        Botao(
          titulo: 'Avançar',
          onPressed: prosseguir
        )
      ],
    );
  }
}