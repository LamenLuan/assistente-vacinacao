import 'package:assistente_vacinacao/components/botao.dart';
import 'package:assistente_vacinacao/components/campo_entrada.dart';
import 'package:assistente_vacinacao/components/pagina_formulario.dart';
import 'package:assistente_vacinacao/components/texto_formulario.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CadastroPessoa2Page extends StatefulWidget {
  CadastroPessoa2Page({Key? key}) : super(key: key);

  @override
  _CadastroPessoa2PageState createState() => _CadastroPessoa2PageState();
}

class _CadastroPessoa2PageState extends State<CadastroPessoa2Page> {
  final meses = [
    'Janeiro',
    'Fevereiro',
    'Março',
    'Abril',
    'Maio',
    'Junho',
    'Julho',
    'Agosto',
    'Setembro',
    'Outubro',
    'Novembro',
    'Dezembro'
  ];
  String mesEscolhido = '1';
  bool isMasculino = true, isComorbidade = false;

  List<DropdownMenuItem<String>> carregaMeses()
  {
    List<DropdownMenuItem<String>> mesesDropdown = [];
    for(var i = 0; i < meses.length; i++) {
      mesesDropdown.add(
        DropdownMenuItem(child: Text(meses[i], style: TextStyle(fontSize: 22),), value: '${i + 1}')
      );
    }

    return mesesDropdown;
  }

  void onMesesChanged(String? valor)
  {
    setState(() {
      mesEscolhido = valor!;
    });
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

  @override
  Widget build(BuildContext context) {
    return PaginaFormulario(
      titulo: 'Parte 2 de 4',
      children: [
        TextoFormulario(
          texto:'Insira sua data de nascimento e seus dados físicos',
          marginBottom: 24,
        ),
        Row( children: [TextoFormulario(texto: 'Data de nascimento:')] ),
        Row(
          children: [
            CampoEntrada(
              titulo: 'Dia',
              marginTop: 6,
              marginRight: 6,
              width: 75,
              enableSuggestions: false,
              autocorrect: false,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ]
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(right: 6, top: 6),
                alignment: Alignment.center,
                child: DropdownButton<String>(
                  value: mesEscolhido,
                  items: carregaMeses(),
                  onChanged: onMesesChanged,
                  underline: SizedBox(),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(color: Colors.grey),
                ),
                height: 66,
              ),
            ),
            CampoEntrada(
              titulo: 'Ano',
              marginTop: 6,
              width: 100,
              enableSuggestions: false,
              autocorrect: false,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ]
            )
          ],
        ),
        Row(
          children: [
            TextoFormulario(
              texto: 'Gênero:',
              marginTop: 12,
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
          onPressed: () {
            // Navigator.push(context, MaterialPageRoute(
            //   builder: (_) => CadastroPessoa2Page()
            // ));
          }
        )
      ],
    );
  }
}