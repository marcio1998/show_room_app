import 'package:flutter/material.dart';

class PaginaInicial extends StatelessWidget {
  final String userId;
  PaginaInicial(this.userId);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Logado"),
      ),
    );
  }
}
