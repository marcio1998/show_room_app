import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:show_room_app/CadastrarCarro.dart';
import 'package:show_room_app/CadastrarMoto.dart';
import 'package:show_room_app/CadastroDeUsuario.dart';
import 'package:show_room_app/CarrosCadastrados.dart';
import 'package:show_room_app/EditarMoto.dart';
import 'package:show_room_app/Login.dart';
import 'package:show_room_app/MostrarUsuariosCadastrados.dart';
import 'package:show_room_app/MotosCadastradas.dart';
import 'package:show_room_app/Sobre.dart';
import 'package:show_room_app/UsuariosCadastrados.dart';
import 'package:show_room_app/EditarCarro.dart';
import 'PaginaInicial.dart';

void main() async {
  //FAZENDO A INICIALIZAÇÃO DO BANCO DE DADOS.
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  //Monitoramento em tempo real
  CollectionReference reference =
      FirebaseFirestore.instance.collection('usuarios');
  reference.snapshots().listen((QuerySnapshot querySnapshot) {
    querySnapshot.docChanges.forEach((element) {
      print('Usario atualizadas com sucesso');
    });
  });
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ShowRoom App',
      theme: ThemeData(
        primaryColor: Colors.amber[600],
        scaffoldBackgroundColor: Colors.amber[600],
        appBarTheme: AppBarTheme(
            color: Colors.amber[600],
            centerTitle: true,
            titleTextStyle: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            )),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
        )),
        textTheme: TextTheme(
            headline1: TextStyle(
                color: Colors.black,
                fontSize: 35,
                fontFamily: 'DancingScript',
                fontWeight: FontWeight.bold),
            headline2: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
            headline3: TextStyle(
              color: Colors.red,
              fontSize: 19,
              fontWeight: FontWeight.bold,
              fontFamily: 'DancingScript',
            ),
            headline4: TextStyle(
              color: Colors.brown,
              fontSize: 24,
              fontWeight: FontWeight.bold,
              fontFamily: 'DancingScript',
            ),
            headline5: TextStyle(
              color: Colors.amber,
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
            headline6: TextStyle(
              color: Colors.black,
              fontSize: 22,
              fontWeight: FontWeight.bold,
              fontFamily: 'DancingScript',
            )),
      ),

      //Definição de rotas
      routes: {
        '/cadastrodeusuario': (context) => CadastroDeUsuario(),
        '/login': (context) => Login(),
        '/cadastrarcarro': (context) => CadastrarCarro(),
        '/carroscadastrados': (context) => CarrosCadastrados(),
        '/cadastrarmoto': (context) => CadastrarMoto(),
        '/motoscadastradas': (context) => MotosCadastrdas(),
        '/mostrarusuarios': (context) => UsuariosCadastrados(),
        '/editarcarro': (context) => EditarCarro(),
        '/editarmoto': (context) => EditarMoto(),
        '/sobre': (context) => Sobre(),
      },
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Widget build(BuildContext context) {
    return Login();
  }
}
