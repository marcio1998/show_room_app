/*
 * Modelo de dados que será utilizado para 
 * encapsular os dados recuperados do Cloud
 * Firestorm
 */

//CLASSE TESTE

class Cafe {
  //Atributos = Campos do documento
  late String id;
  late String nome;
  late String preco;

  //Construtor
  Cafe(this.id, this.nome, this.preco);

  //Converter um DOCUMENTO em um OBJETO
  Cafe.fromJson(Map<String, dynamic> map, String id) {
    //O id é por que eu quero checar ele
    //Aqui é tudo igual, Strin e Dynamic por que são as unicas variaveis aceitas no firebase
    this.id = id;
    this.nome = map['nome'];
    this.preco = map['preco'];
  }

  //Converter um OBJETO em um DOCUMENTO
  Map<String, dynamic> toJson() {
    return {'id': this.id, 'nome': this.nome, 'preco': this.preco};
  }
}
