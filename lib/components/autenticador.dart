import 'package:assistente_vacinacao/pages/login_page.dart';
import 'package:assistente_vacinacao/pages/slider_page_controller.dart';
import 'package:assistente_vacinacao/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Autenticador extends StatefulWidget {
  Autenticador({ Key? key }) : super(key: key);

  @override
  _AutenticadorState createState() => _AutenticadorState();
}

loading() {
  return Scaffold(
    body: Center(
      child: CircularProgressIndicator(),
    ),
  );
}

class _AutenticadorState extends State<Autenticador> {
  @override
  Widget build(BuildContext context) {
    AuthService auth = Provider.of<AuthService>(context);

    if(auth.isLoading) return loading();
    else if(auth.usuario == null) return LoginPage();
    else return SliderPage();
  }
}