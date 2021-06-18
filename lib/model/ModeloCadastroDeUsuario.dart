import 'package:flutter/foundation.dart';

class ModeloCadastroDeusuario {
  late String id;
  late String nome;
  late String telefone;
  late String email;
  late String senha;

  ModeloCadastroDeusuario(@required this.id, @required this.nome,
      @required this.telefone, @required this.email, @required this.senha);

  ModeloCadastroDeusuario.fromJson(Map<String, dynamic> map, String id) {
    //O id é por que eu quero checar ele
    //Aqui é tudo igual, Strin e Dynamic por que são as unicas variaveis aceitas no firebase
    this.id = id;
    this.nome = map['nome'];
    this.telefone = map['telefone'];
  }

  Map<String, dynamic> toJson() {
    return {'id': this.id, 'nome': this.nome, 'telefone': this.telefone};
  }
}
