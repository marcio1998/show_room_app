import 'package:flutter/material.dart';

class PaginaInicial extends StatelessWidget {
  final String userId;
  PaginaInicial(this.userId);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pagina Inicial"),
      ),
      drawer: Drawer(
        child: Container(
          padding: EdgeInsets.only(left: 20),
          color: Theme.of(context).primaryColor,
          child: ListView(
            children: [
              Container(
                child: DrawerHeader(
                    child: Center(
                  child: Text(
                    "Menu",
                    style: Theme.of(context).textTheme.headline1,
                  ),
                )),
              ),
              ListTile(
                title: Text(
                  "Cadastrar Carro",
                  style: Theme.of(context).textTheme.headline2,
                ),
                onTap: () => Navigator.pushNamed(context, '/cadastrarcarro'),
              ),
              ListTile(
                title: Text(
                  "Carros Cadastrados",
                  style: Theme.of(context).textTheme.headline2,
                ),
                onTap: () => Navigator.pushNamed(context, '/carroscadastrados'),
              ),
              ListTile(
                title: Text(
                  "Cadastrar Moto",
                  style: Theme.of(context).textTheme.headline2,
                ),
                onTap: () => Navigator.pushNamed(context, '/cadastrarmoto'),
              ),
              ListTile(
                title: Text(
                  "Motos Cadastradas",
                  style: Theme.of(context).textTheme.headline2,
                ),
                onTap: () => Navigator.pushNamed(context, '/motoscadastradas'),
              ),
              ListTile(
                title: Text(
                  "Usuários Cadastrados",
                  style: Theme.of(context).textTheme.headline2,
                ),
                onTap: () => Navigator.pushNamed(context, '/mostrarusuarios'),
              ),
              ListTile(
                title: Text(
                  "Sobre",
                  style: Theme.of(context).textTheme.headline2,
                ),
                onTap: () => Navigator.pushNamed(context, '/sobre'),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              margin: EdgeInsets.only(bottom: 40),
              child: Text(
                "Show Room App",
                style: Theme.of(context).textTheme.headline1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
