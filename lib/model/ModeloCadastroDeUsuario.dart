import 'package:flutter/foundation.dart';

class ModeloCadastroDeusuario {
  String nome;
  String telefone;
  String email;
  String senha;

  ModeloCadastroDeusuario(@required this.nome, @required this.telefone,
      @required this.email, @required this.senha);
}
