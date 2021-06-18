import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:show_room_app/CadastroDeUsuario.dart';
import 'package:show_room_app/Cafe.dart';
import 'package:show_room_app/Login.dart';
import 'PaginaInicial.dart';

//CÓDIGO PARA VERIFICAÇÃO DO BANCO DE DADOS.
//  var db = FirebaseFirestore.instance;

//       db
//           .collection('cafes')
//           .add({"nome": "Café Melita 500g", "preco": "R\$ 9,85"});
//       db
//           .collection('cafes')
//           .doc("cafe001")
//           .set({"nome": "Café Melita 500g", "preco": "R\$ 9,85"});

//       Cafe cafe = Cafe('', 'Café Utam 1kg', 'R\$ 25,65');
//       db.collection('cafes').add(cafe.toJson());

void main() async {
  //FAZENDO A INICIALIZAÇÃO DO BANCO DE DADOS.
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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
            )),
      ),

      //Definição de rotas
      routes: {
        '/cadastrodeusuario': (context) => CadastroDeUsuario(),
        '/login': (context) => Login()
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
