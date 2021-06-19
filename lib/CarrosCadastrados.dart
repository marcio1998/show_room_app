import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:show_room_app/MostrarCarro.dart';

import 'model/Carro.dart';

class CarrosCadastrados extends StatefulWidget {
  @override
  _CarrosCadastradosState createState() => _CarrosCadastradosState();
}

class _CarrosCadastradosState extends State<CarrosCadastrados> {
  late CollectionReference carros;
  @override
  Widget build(BuildContext context) {
    carros = FirebaseFirestore.instance.collection('carros');
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Carros Cadastrados",
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: carros.snapshots(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return Center(
                    child: Text('Erro Ao Conectar Com Banco De Dados'));
              case ConnectionState.waiting:
                return Center(child: CircularProgressIndicator());
              default:
                final dados = snapshot.requireData;
                return ListView.builder(
                    itemCount: dados.size,
                    itemBuilder: (context, index) {
                      return MostrarCarro(dados.docs[index]);
                    });
            }
          }),
    );
  }
}
