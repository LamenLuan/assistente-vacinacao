import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CampoEntrada extends StatefulWidget {
  final String titulo;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final bool obscureText, enableSuggestions, autocorrect;
  final double marginTop, marginRight;
  final double? width;
  final String? Function(String?)? validator;
  final int? maxLength;
  final TextEditingController? controller;

  CampoEntrada(
    {
      Key? key,
      required this.titulo,
      this.keyboardType,
      this.inputFormatters,
      this.obscureText = false,
      this.enableSuggestions = true,
      this.autocorrect = true,
      this.marginTop = 24,
      this.marginRight = 0,
      this.width,
      this.validator,
      this.maxLength,
      this.controller
    }
  ) : super(key: key);

  @override
  _CampoEntradaState createState() => _CampoEntradaState();
}

class _CampoEntradaState extends State<CampoEntrada> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: widget.marginTop, right: widget.marginRight),
      child: TextFormField(
        obscureText: widget.obscureText,
        enableSuggestions: widget.enableSuggestions,
        autocorrect: widget.autocorrect,
        controller: widget.controller,
        style: TextStyle(
          fontSize: 22
        ),
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: widget.titulo,
          counterText: ''
        ),
        keyboardType: widget.keyboardType,
        inputFormatters: widget.inputFormatters,
        validator: widget.validator,
        maxLength: widget.maxLength,
      ),
      width: widget.width,
    );
  }
}
