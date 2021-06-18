import 'package:flutter/material.dart';

class CadastroDeUsuario extends StatelessWidget {
  var _emailUsuarioController = TextEditingController();
  var _senhaUsuarioController = TextEditingController();
  var _nomeUsuarioController = TextEditingController();
  var _telefoneUsuarioController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
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
                          onPressed: () => {
                                if (this._formKey.currentState!.validate())
                                  {print("OK")}
                              },
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
}
