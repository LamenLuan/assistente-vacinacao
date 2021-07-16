import 'package:flutter/material.dart';

class Botao extends StatefulWidget {
  final String titulo;
  final Function onPressed;
  final double marginTop;

  Botao(
    {
      Key? key,
      required this.titulo,
      required this.onPressed,
      this.marginTop = 24
    }
  ) : super(key: key);

  @override
  _BotaoState createState() => _BotaoState();
}

class _BotaoState extends State<Botao> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      margin: EdgeInsets.only(top: widget.marginTop),
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