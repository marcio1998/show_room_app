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
    this.id = id;
    this.nome = map['nome'];
    this.telefone = map['telefone'];
    this.email = map['email'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': this.id,
      'nome': this.nome,
      'telefone': this.telefone,
      'email': this.email
    };
  }
}
