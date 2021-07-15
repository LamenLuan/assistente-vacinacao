import 'package:flutter/material.dart';

class PaginaFormulario extends StatefulWidget {
  final String titulo;
  final List<Widget> children;

  PaginaFormulario(
    {
      Key? key,
      required this.titulo,
      this.children = const <Widget>[]
    }
  ) : super(key: key);

  @override
  _PaginaFormularioState createState() => _PaginaFormularioState();
}

class _PaginaFormularioState extends State<PaginaFormulario> {
  final _form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.titulo),
        centerTitle: true
      ),
      body: Center(
        child: Form(
          key: _form,
          child: Padding(
            padding: const EdgeInsets.all(48),
            child: Column( children: widget.children ),
          )
        ),
      ),
      resizeToAvoidBottomInset: false
    );
  }
}