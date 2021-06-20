import 'package:flutter/material.dart';
import 'package:show_room_app/model/ModeloCadastroDeUsuario.dart';

class MostrarUsuariosCadastrados extends StatelessWidget {
  late var item;
  MostrarUsuariosCadastrados(this.item);
  @override
  Widget build(BuildContext context) {
    ModeloCadastroDeusuario usuario =
        ModeloCadastroDeusuario.fromJson(item.data(), item.id);
    return Card(
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  'Nome: ',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              Container(
                  padding: EdgeInsets.only(left: 3, top: 8),
                  child: Text(
                    usuario.nome,
                    style: Theme.of(context).textTheme.headline5,
                  ))
            ],
          ),
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  'Telefone: ',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              Container(
                  padding: EdgeInsets.only(left: 3, top: 8),
                  child: Text(
                    usuario.telefone,
                    style: Theme.of(context).textTheme.headline5,
                  ))
            ],
          ),
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  'Email: ',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              Container(
                  padding: EdgeInsets.only(left: 3, top: 8),
                  child: Text(
                    usuario.email,
                    style: Theme.of(context).textTheme.headline5,
                  ))
            ],
          ),
        ],
      ),
    );
  }
}
