import 'package:flutter/material.dart';

class TextoPPage extends StatefulWidget {
  final String texto;
  final double marginTop, marginBottom;
  final TextAlign textAlign;

  TextoPPage(
      {Key? key,
      required this.texto,
      this.marginTop = 20,
      this.marginBottom = 20,
      this.textAlign = TextAlign.center})
      : super(key: key);

  @override
  _TextoPPageState createState() => _TextoPPageState();
}

class _TextoPPageState extends State<TextoPPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        widget.texto,
        style: TextStyle(fontSize: 22, color: Colors.black87),
        textAlign: widget.textAlign,
      ),
      margin:
          EdgeInsets.only(top: widget.marginTop, bottom: widget.marginBottom),
    );
  }
}
