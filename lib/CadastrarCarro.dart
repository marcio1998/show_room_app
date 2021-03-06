import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:show_room_app/model/Carro.dart';

class CadastrarCarro extends StatefulWidget {
  const CadastrarCarro({Key? key}) : super(key: key);

  @override
  _CadastrarCarroState createState() => _CadastrarCarroState();
}

class _CadastrarCarroState extends State<CadastrarCarro> {
  var _marcaCarroController = TextEditingController();
  var _modeloCarroController = TextEditingController();
  var _anoCarroController = TextEditingController();
  var _potenciaCarroController = TextEditingController();
  var _motorCarroController = TextEditingController();
  var _urlImgCarroController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Cadastrar Carro",
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: this._formKey,
          child: Column(
            children: [
              SizedBox(
                height: 90,
              ),
              Container(
                margin: EdgeInsets.only(bottom: 40),
                child: Text(
                  "Cadastro Carro",
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
                    hintText: "Ensira a Marca",
                  ),
                  controller: this._marcaCarroController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Por Favor, Informe a Marca";
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              TextFormField(
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline2,
                decoration: InputDecoration(
                  errorStyle: Theme.of(context).textTheme.headline3,
                  border: InputBorder.none,
                  hintStyle: Theme.of(context).textTheme.headline2,
                  hintText: "Ensira o Modelo",
                ),
                controller: this._modeloCarroController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Por Favor, Informe o Modelo";
                  } else {
                    return null;
                  }
                },
              ),
              TextFormField(
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline2,
                decoration: InputDecoration(
                  errorStyle: Theme.of(context).textTheme.headline3,
                  border: InputBorder.none,
                  hintStyle: Theme.of(context).textTheme.headline2,
                  hintText: "Ensira o Ano",
                ),
                controller: this._anoCarroController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Por Favor, Informe o Ano";
                  } else {
                    return null;
                  }
                },
              ),
              TextFormField(
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline2,
                decoration: InputDecoration(
                  errorStyle: Theme.of(context).textTheme.headline3,
                  border: InputBorder.none,
                  hintStyle: Theme.of(context).textTheme.headline2,
                  hintText: "Ensira a Pot??ncia",
                ),
                controller: this._potenciaCarroController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Por Favor, Informe a pot??ncia";
                  } else {
                    return null;
                  }
                },
              ),
              TextFormField(
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline2,
                decoration: InputDecoration(
                  errorStyle: Theme.of(context).textTheme.headline3,
                  border: InputBorder.none,
                  hintStyle: Theme.of(context).textTheme.headline2,
                  hintText: "Ensira o Motor",
                ),
                controller: this._motorCarroController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Por Favor, Informe o Motor";
                  } else {
                    return null;
                  }
                },
              ),
              TextFormField(
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline2,
                decoration: InputDecoration(
                  errorStyle: Theme.of(context).textTheme.headline3,
                  border: InputBorder.none,
                  hintStyle: Theme.of(context).textTheme.headline2,
                  hintText: "Ensira a Url Da Imagem",
                ),
                controller: this._urlImgCarroController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Por Favor, Informe a Url da Imagem";
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
                    onPressed: () => this.cadastrarCarro(
                        this._marcaCarroController.text,
                        this._modeloCarroController.text,
                        this._anoCarroController.text,
                        this._potenciaCarroController.text,
                        this._motorCarroController.text,
                        this._urlImgCarroController.text),
                    child: Text(
                      "Cadastrar Carro",
                      style: TextStyle(
                        color: Colors.amber[800],
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void cadastrarCarro(marca, modelo, ano, potencia, motor, urlImg) {
    if (this._formKey.currentState!.validate()) {
      var db = FirebaseFirestore.instance;
      db
          .collection('carros')
          .add(
            Carro(marca, modelo, ano, potencia, motor, urlImg).toJson(),
          )
          .then((value) => {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("Carro cadastrado com Sucesso"),
                  duration: Duration(seconds: 5),
                )),
                Navigator.pop(context)
              })
          .catchError((erro) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(erro.code), duration: Duration(seconds: 2)));
      });
    }
  }
}
