import 'package:flutter/material.dart';

class PaginaFormulario extends StatefulWidget {
  final String titulo;
  final List<Widget> children;
  final GlobalKey<FormState>? formKey;

  PaginaFormulario(
    {
      Key? key,
      required this.titulo,
      this.children = const <Widget>[],
      this.formKey
    }
  ) : super(key: key);

  @override
  _PaginaFormularioState createState() => _PaginaFormularioState();
}

class _PaginaFormularioState extends State<PaginaFormulario> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.titulo),
        centerTitle: true
      ),
      body: Form(
        key: widget.formKey,
        child: Padding(
          padding: const EdgeInsets.all(42),
          child: Column( children: widget.children ),
        )
      ),
      resizeToAvoidBottomInset: false
    );
  }
}