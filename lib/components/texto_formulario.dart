import 'package:flutter/material.dart';

class TextoFormulario extends StatefulWidget {
  final String texto;
  final double marginTop, marginBottom;
  final TextAlign textAlign;

  TextoFormulario(
    {
      Key? key,
      required this.texto,
      this.marginTop = 0,
      this.marginBottom = 0,
      this.textAlign = TextAlign.center
    }
  ) : super(key: key);

  @override
  _TextoFormularioState createState() => _TextoFormularioState();
}

class _TextoFormularioState extends State<TextoFormulario> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        widget.texto,
        style: TextStyle(
          fontSize: 22,
          color: Colors.black87
        ),
        textAlign: widget.textAlign,
      ),
      margin: EdgeInsets.only(
        top: widget.marginTop,
        bottom: widget.marginBottom
      ),
    );
  }
}