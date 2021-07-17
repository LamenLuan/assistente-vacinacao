import 'package:assistente_vacinacao/components/botao.dart';
import 'package:assistente_vacinacao/components/pagina_formulario.dart';
import 'package:assistente_vacinacao/components/texto.dart';
import 'package:assistente_vacinacao/models/cidadao.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'cadastro_pessoa3_page.dart';

class CadastroPessoa2Page extends StatefulWidget {
  final Cidadao cidadao;
  
  CadastroPessoa2Page({Key? key, required this.cidadao}) : super(key: key);

  @override
  _CadastroPessoa2PageState createState() => _CadastroPessoa2PageState();
}

class _CadastroPessoa2PageState extends State<CadastroPessoa2Page> {
  bool isMasculino = true, comorbidade = false;
  DateTime? dataNascimento;

  final _dataController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void prosseguir() {
    if( _formKey.currentState!.validate() ) {
      Cidadao cidadao = widget.cidadao;
      cidadao.dataNascimento = dataNascimento!;
      cidadao.isMasculino = isMasculino;
      cidadao.comorbidade = comorbidade;

      Navigator.push(context, MaterialPageRoute(
        builder: (_) => CadastroPessoa3Page(cidadao: widget.cidadao)
      ));
    }
  }

  Future selecionaData() async {
    FocusScope.of(context).requestFocus( new FocusNode() );
    final DateFormat formatter = DateFormat('dd/MM/yyyy');

    DateTime? selecionada = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: new DateTime(1900),
      lastDate: new DateTime.now(),
      locale: const Locale('pt', 'BR')
    );

    if(selecionada != null) {
      setState( () =>
        _dataController.value = TextEditingValue(
          text: formatter.format(selecionada)
        )
      );
      dataNascimento = selecionada;
    }
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
      comorbidade = valor!;
    });
  }

  String? dataNascimentoValidator(String? value) {
    if(value!.isEmpty) return 'Informe a data de nascimento';
  }

  @override
  Widget build(BuildContext context) {
    return PaginaFormulario(
      formKey: _formKey,
      titulo: 'Parte 2 de 4',
      children: [
        Texto(
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
            suffixIcon: Icon(Icons.calendar_today)
          ),
          onTap: selecionaData,
          validator: dataNascimentoValidator,
        ),
        Row(
          children: [
            Texto(
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
            Texto(
              texto: 'Comorbidade?',
              marginTop: 24,
            )
          ]
        ),
        Row(
          children: [
            Radio(
              value: true,
              groupValue: comorbidade,
              onChanged: onComorbidadeChanged,
            ),
            Text( 'Sim', style: TextStyle(fontSize: 20) ),
            Radio(
              value: false,
              groupValue: comorbidade,
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