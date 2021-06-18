import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:show_room_app/CadastroDeUsuario.dart';
import 'package:show_room_app/Cafe.dart';
import 'PaginaInicial.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
      body: SingleChildScrollView(
          child: Form(
              key: this._formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 90,
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 40),
                    child: Text(
                      "Show Room App",
                      style: Theme.of(context).textTheme.headline1,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 15),
                    child: TextFormField(
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headline2,
                      decoration: InputDecoration(
                        errorStyle: Theme.of(context).textTheme.headline3,
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
                      errorStyle: Theme.of(context).textTheme.headline3,
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
                        onPressed: () => this.logar(
                            this._emailUsuarioController.text,
                            this._senhaUsuarioController.text),
                        child: Text(
                          "Entrar",
                          style: TextStyle(
                            color: Colors.amber[800],
                          ),
                        )),
                  ),
                  Container(
                      padding: EdgeInsets.only(top: 70),
                      child: TextButton(
                          onPressed: () => Navigator.pushNamed(
                              context, '/cadastrodeusuario'),
                          child: Text(
                            "Cadastrar Usuário",
                            style: Theme.of(context).textTheme.headline4,
                          )))
                ],
              ))),
    );
  }

  Future<void> logar(email, senha) async {
    if (this._formKey.currentState!.validate()) {
      try {
        await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: senha)
            .then((value) => Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => PaginaInicial(value.user!.uid))));
      } on FirebaseAuthException catch (e) {
        var codigoDeErro = e.code;
        var mensagem = '';
        if (codigoDeErro == 'user-not-found') {
          mensagem = "Usuário Não Encontrado";
        } else if (codigoDeErro == 'wrong-password') {
          mensagem = "Senha Errada";
        } else if (codigoDeErro == 'invalid-email') {
          mensagem = "Email inválido";
        } else {
          mensagem = codigoDeErro;
        }
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(mensagem),
          duration: Duration(seconds: 2),
        ));
      }
    }
  }
}
