import 'package:assistente_vacinacao/components/autenticador.dart';
import 'package:assistente_vacinacao/repositories/posto_de_saude_repository.dart';
import 'package:assistente_vacinacao/repositories/usuarios_repository.dart';
import 'package:assistente_vacinacao/services/auth_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider( create: (context) => AuthService() ),
        ChangeNotifierProvider( create: (context) => PostoDeSaudeRepository() ),
        ChangeNotifierProvider(
          create: (context) => UsuariosRepository(
            authService: Provider.of<AuthService>(context, listen: false)
          )
        )
      ],
      child: MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AssistenteVacinacao',
      debugShowCheckedModeBanner: false,
      home: Autenticador(),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate
      ],
      theme: ThemeData(
        primaryColor: Colors.teal[400]
      ),
      supportedLocales: [
        const Locale('en'),
        const Locale('pt')
      ],
    );
  }
}