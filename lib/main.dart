import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:show_room_app/Cafe.dart';

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
            )),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _emailUsuarioController = TextEditingController();
  var _senhaUsuarioController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Faça Login Para Entrar",
            style: Theme.of(context).appBarTheme.titleTextStyle),
      ),
      body: Center(
          child: Form(
              key: this._formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 40),
                    child: Text(
                      "Show Room App",
                      style: Theme.of(context).textTheme.headline1,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(15),
                    child: TextFormField(
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headline2,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintStyle: Theme.of(context).textTheme.headline2,
                        hintText: "Ensira o Email",
                      ),
                      controller: this._emailUsuarioController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Por Favor, Informe o Usuário";
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  TextFormField(
                    obscureText: true,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline2,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintStyle: Theme.of(context).textTheme.headline2,
                      hintText: "Ensira a senha",
                    ),
                    controller: this._senhaUsuarioController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Por Favor, Informe a Senha";
                      } else {
                        return null;
                      }
                    },
                  ),
                  Container(
                    width: 200,
                    height: 50,
                    margin: EdgeInsets.only(top: 50),
                    child: ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          "Entrar",
                          style: TextStyle(
                            color: Colors.amber[800],
                          ),
                        )),
                  )
                ],
              ))),
    );
  }
}
