import 'package:flutter/material.dart';

class TextoFormulario extends StatefulWidget {
  final String texto;

  TextoFormulario({Key? key, required this.texto}) : super(key: key);

  @override
  _TextoFormularioState createState() => _TextoFormularioState();
}

class _TextoFormularioState extends State<TextoFormulario> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.texto,
      style: TextStyle(
        fontSize: 22,
        color: Colors.black87
      ),
      textAlign: TextAlign.center,
    );
  }
}