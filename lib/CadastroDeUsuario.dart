import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CadastroDeUsuario extends StatefulWidget {
  const CadastroDeUsuario({Key? key}) : super(key: key);

  @override
  _CadastroDeUsuarioState createState() => _CadastroDeUsuarioState();
}

class _CadastroDeUsuarioState extends State<CadastroDeUsuario> {
  var _emailUsuarioController = TextEditingController();
  var _senhaUsuarioController = TextEditingController();
  var _nomeUsuarioController = TextEditingController();
  var _telefoneUsuarioController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void limpar() {
    this._emailUsuarioController.clear();
    this._senhaUsuarioController.clear();
    this._nomeUsuarioController.clear();
    this._telefoneUsuarioController.clear();
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cadastro De Usuário',
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 70,
            ),
            Container(
              padding: EdgeInsets.only(bottom: 50),
              child: Center(
                child: Text(
                  "Cadastrar Novo Usuario",
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
            ),
            Form(
                key: this._formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      child: TextFormField(
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headline2,
                        decoration: InputDecoration(
                          errorStyle: Theme.of(context).textTheme.headline3,
                          border: InputBorder.none,
                          hintStyle: Theme.of(context).textTheme.headline2,
                          hintText: "Ensira o nome",
                        ),
                        controller: this._nomeUsuarioController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Por Favor, Informe o Nome";
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(15),
                      child: TextFormField(
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.headline2,
                        decoration: InputDecoration(
                          errorStyle: Theme.of(context).textTheme.headline3,
                          border: InputBorder.none,
                          hintStyle: Theme.of(context).textTheme.headline2,
                          hintText: "Ensira o Telefone",
                        ),
                        controller: this._telefoneUsuarioController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Por Favor, Informe o Telefone";
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
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
                    Container(
                      padding: EdgeInsets.all(10),
                      child: TextFormField(
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
                    ),
                    Container(
                      width: 200,
                      height: 50,
                      margin: EdgeInsets.only(top: 20, bottom: 15),
                      child: ElevatedButton(
                          onPressed: () => this.cadastro(
                              this._emailUsuarioController.text,
                              this._senhaUsuarioController.text,
                              this._nomeUsuarioController.text,
                              this._telefoneUsuarioController.text),
                          child: Text(
                            "Cadastrar",
                            style: TextStyle(
                              color: Colors.amber[800],
                            ),
                          )),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }

  Future<void> cadastro(email, senha, nome, telefone) async {
    if (this._formKey.currentState!.validate()) {
      try {
        await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: senha)
            .then((value) {
          var db = FirebaseFirestore.instance;
          db
              .collection('usuarios')
              .doc(value.user!.uid)
              .set({'nome': nome, 'telefone': telefone, 'email': email}).then(
                  (value) {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text("Usuário Cadastrado com Sucesso"),
                    actions: [
                      TextButton(
                          onPressed: () => this.limpar(),
                          child: Text('Retornar'))
                    ],
                  );
                });
          }).catchError((onError) {
            var erro = onError.code;
            print(erro);
          });
        });
      } on FirebaseAuthException catch (e) {
        var codigoDeErro = e.code;
        var mensagem = '';
        if (codigoDeErro == 'email-already-in-use') {
          mensagem = "Email Já Está em Uso";
        } else if (codigoDeErro == 'weak-password') {
          mensagem = "Senha Fraca";
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
