import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:show_room_app/model/Moto.dart';

class EditarMoto extends StatefulWidget {
  @override
  _EditarMotoState createState() => _EditarMotoState();
}

class _EditarMotoState extends State<EditarMoto> {
  var _marcaCarroController = TextEditingController();
  var _modeloCarroController = TextEditingController();
  var _anoCarroController = TextEditingController();
  var _potenciaCarroController = TextEditingController();
  var _motorCarroController = TextEditingController();
  var _urlImgCarroController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  buscarDocumentoPorId(var id) async {
    await FirebaseFirestore.instance
        .collection('motos')
        .doc(id)
        .get()
        .then((value) {
      _marcaCarroController.text = value.data()!['marca'].toString();
      _modeloCarroController.text = value.data()!['modelo'].toString();
      _anoCarroController.text = value.data()!['ano'].toString();
      _potenciaCarroController.text = value.data()!['potencia'].toString();
      _motorCarroController.text = value.data()!['motor'].toString();
      _urlImgCarroController.text = value.data()!['urlImg'].toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    var id = ModalRoute.of(context)!.settings.arguments;
    buscarDocumentoPorId(id);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Editar Moto",
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
                  "Editar Moto",
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
                  hintText: "Ensira a Potência",
                ),
                controller: this._potenciaCarroController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Por Favor, Informe a potência";
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
                        id,
                        this._marcaCarroController.text,
                        this._modeloCarroController.text,
                        this._anoCarroController.text,
                        this._potenciaCarroController.text,
                        this._motorCarroController.text,
                        this._urlImgCarroController.text),
                    child: Text(
                      "Atualizar Moto",
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

  void cadastrarCarro(id, marca, modelo, ano, potencia, motor, urlImg) {
    if (this._formKey.currentState!.validate()) {
      var db = FirebaseFirestore.instance;
      db
          .collection('motos')
          .doc(id)
          .set(
            Moto(marca, modelo, ano, potencia, motor, urlImg).toJson(),
          )
          .then((value) => {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("Moto Atualizado com Sucesso"),
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
