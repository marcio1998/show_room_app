import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:show_room_app/MostrarMoto.dart';

class MotosCadastrdas extends StatefulWidget {
  const MotosCadastrdas({Key? key}) : super(key: key);

  @override
  _MotosCadastrdasState createState() => _MotosCadastrdasState();
}

class _MotosCadastrdasState extends State<MotosCadastrdas> {
  late CollectionReference motos;
  @override
  Widget build(BuildContext context) {
    motos = FirebaseFirestore.instance.collection('motos');
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Motos Cadastradas",
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: motos.snapshots(),
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
                      return MostrarMoto(dados.docs[index]);
                    });
            }
          }),
    );
  }
}
