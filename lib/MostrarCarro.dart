import 'package:flutter/material.dart';

import 'model/Carro.dart';

class MostrarCarro extends StatelessWidget {
  late var item;
  MostrarCarro(this.item);

  @override
  Widget build(BuildContext context) {
    Carro carro = Carro.fromJson(item.data(), item.id);
    return Card(
      child: Row(
        children: [
          Column(
            children: [
              Container(
                child: Image.network(carro.urlImg),
                width: 150,
              )
            ],
          ),
          Column(
            children: [
              Container(
                  padding: EdgeInsets.only(left: 30, top: 10),
                  child: Text(
                    carro.marca,
                    style: Theme.of(context).textTheme.headline1,
                  )),
              Row(
                children: [
                  FittedBox(
                    fit: BoxFit.contain,
                    child: Container(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        'Modelo: ',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                  ),
                  FittedBox(
                    fit: BoxFit.contain,
                    child: Container(
                        padding: EdgeInsets.only(left: 10, top: 8),
                        child: Text(
                          carro.modelo,
                          style: Theme.of(context).textTheme.headline5,
                        )),
                  ),
                ],
              ),
              Row(
                children: [
                  FittedBox(
                    fit: BoxFit.contain,
                    child: Container(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        'Ano: ',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                  ),
                  FittedBox(
                    fit: BoxFit.contain,
                    child: Container(
                        padding: EdgeInsets.only(left: 10, top: 8),
                        child: Text(
                          carro.ano,
                          style: Theme.of(context).textTheme.headline5,
                        )),
                  ),
                ],
              ),
              Row(
                children: [
                  FittedBox(
                    fit: BoxFit.contain,
                    child: Container(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        'Potência: ',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                  ),
                  FittedBox(
                    fit: BoxFit.contain,
                    child: Container(
                        padding: EdgeInsets.only(left: 10, top: 8),
                        child: Text(
                          carro.potencia,
                          style: Theme.of(context).textTheme.headline5,
                        )),
                  ),
                ],
              ),
              Row(
                children: [
                  FittedBox(
                    fit: BoxFit.contain,
                    child: Container(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        'Motor: ',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                  ),
                  FittedBox(
                    fit: BoxFit.contain,
                    child: Container(
                        padding: EdgeInsets.only(left: 10, top: 8, bottom: 10),
                        child: Text(
                          carro.motor,
                          style: Theme.of(context).textTheme.headline5,
                        )),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.only(left: 180, bottom: 10),
                child: FloatingActionButton(
                  backgroundColor: Colors.amber,
                  onPressed: () => Navigator.pushNamed(context, '/editarcarro',
                      arguments: carro.id),
                  child: Icon(Icons.update),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
