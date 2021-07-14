import 'package:flutter/material.dart';

class Botao extends StatefulWidget {
  final String titulo;
  final Function onPressed;

  Botao({Key? key, required this.titulo, required this.onPressed}) : super(key: key);

  @override
  _BotaoState createState() => _BotaoState();
}

class _BotaoState extends State<Botao> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      margin: EdgeInsets.only(top: 24),
      child: ElevatedButton(
        onPressed: () => widget.onPressed(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                widget.titulo,
                style: TextStyle(fontSize: 20),
              ),
            )
          ],
        ),
      ),
    );
  }
}