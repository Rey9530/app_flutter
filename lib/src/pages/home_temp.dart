import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  final opciones = ['UNO', 'DOS', 'TRES', 'CUATRO', 'CINCO'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Componet Temp"),
      ),
      body: ListView(
        //children: _crearitems(),
        children: _crearItemsCorta(),
      ),
    );
  }

  List<Widget> _crearitems() {
    List<Widget> lista = <Widget>[];

    for (var opt in opciones) {
      final tempWidget = ListTile(
        title: Text(opt),
      );

      lista..add(tempWidget)..add(Divider());
    }
    return lista;
  }

  List<Widget> _crearItemsCorta() {
    return opciones.map((e) {
      return Column(
        children: [
          ListTile(
            title: Text(e + "!!!"),
            subtitle: Text("Other things"),
            leading: Icon(Icons.account_circle),
            trailing: Icon(Icons.arrow_forward_ios_sharp),
            onTap: () {},
          ),
          Divider(
            color: Color(0),
            height: 0,
            endIndent: 0,
          )
        ],
      );
    }).toList();
  }
}
