import 'package:flutter/material.dart';

class CampoEntrada extends StatefulWidget {
  final String titulo;

  CampoEntrada({Key? key, required this.titulo}) : super(key: key);

  @override
  _CampoEntradaState createState() => _CampoEntradaState();
}

class _CampoEntradaState extends State<CampoEntrada> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 24),
      child: TextFormField(
        style: TextStyle(
          fontSize: 22
        ),
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: widget.titulo,
        )
      ),
    );
  }
}
