import 'package:flutter/material.dart';

class Sobre extends StatelessWidget {
  const Sobre({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Sobre",
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
      ),
      body: Column(
        children: [
          Center(
            child: Container(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                "Marcio Gabriel G. Mengali ",
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
          ),
          Container(
            child: Image.asset('assets/images/minhafoto.jpg'),
          ),
          Center(
            child: Container(
              padding: EdgeInsets.only(top: 10),
              child: Text(
                "Murilo ",
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
          ),
          Container(
            height: 200,
            width: 200,
            child: Image.asset('assets/images/murilo.jpg'),
          ),
        ],
      ),
    );
  }
}
