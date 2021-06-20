import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:show_room_app/MostrarUsuariosCadastrados.dart';

class UsuariosCadastrados extends StatefulWidget {
  @override
  _UsuariosCadastradosState createState() => _UsuariosCadastradosState();
}

class _UsuariosCadastradosState extends State<UsuariosCadastrados> {
  late CollectionReference usuarios;
  @override
  Widget build(BuildContext context) {
    usuarios = FirebaseFirestore.instance.collection('usuarios');
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Carros Cadastrados",
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: usuarios.snapshots(),
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
                      return MostrarUsuariosCadastrados(dados.docs[index]);
                    });
            }
          }),
    );
  }
}
