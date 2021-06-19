import 'package:flutter/cupertino.dart';

class Carro {
  late String marca;
  late String modelo;
  late String ano;
  late String potencia;
  late String motor;
  late String urlImg;

  Carro(@required this.marca, @required this.modelo, @required this.ano,
      @required this.potencia, @required this.motor, @required this.urlImg);

  Carro.fromJson(Map<String, dynamic> map, String id) {
    //O id é por que eu quero checar ele
    //Aqui é tudo igual, Strin e Dynamic por que são as unicas variaveis aceitas no firebase
    this.marca = map['marca'];
    this.modelo = map['modelo'];
    this.ano = map['ano'];
    this.potencia = map['potencia'];
    this.motor = map['motor'];
    this.urlImg = map['urlImg'];
  }

  Map<String, dynamic> toJson() {
    return {
      'marca': this.marca,
      'modelo': this.modelo,
      'ano': this.ano,
      'potencia': this.potencia,
      'motor': this.motor,
      'urlImg': this.urlImg
    };
  }
}
