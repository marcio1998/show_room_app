import 'package:flutter/material.dart';

import 'model/Moto.dart';

class MostrarMoto extends StatelessWidget {
  late var item;
  MostrarMoto(this.item);

  @override
  Widget build(BuildContext context) {
    Moto moto = Moto.fromJson(item.data(), item.id);
    return Card(
      child: Row(
        children: [
          Column(
            children: [
              Container(
                child: Image.network(moto.urlImg),
                width: 150,
              )
            ],
          ),
          Column(
            children: [
              Container(
                  padding: EdgeInsets.only(left: 30, top: 10),
                  child: Text(
                    moto.marca,
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
                          moto.modelo,
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
                          moto.ano,
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
                          moto.potencia,
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
                          moto.motor,
                          style: Theme.of(context).textTheme.headline5,
                        )),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
