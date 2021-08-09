import 'package:flutter/material.dart';

class BotaoIcone extends StatefulWidget {
  final String titulo;
  final Function onPressed;
  final double marginTop;
  final IconData icone;

  BotaoIcone(
      {Key? key,
      required this.titulo,
      required this.onPressed,
      this.marginTop = 24,
      required this.icone})
      : super(key: key);

  @override
  _BotaoIconeState createState() => _BotaoIconeState();
}

class _BotaoIconeState extends State<BotaoIcone> {
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
            ),
            Icon(widget.icone),
          ],
        ),
        style: ElevatedButton.styleFrom(
          primary: Colors.teal[400]
        )
      ),
    );
  }
}
