import 'package:components/src/pages/alerts_page.dart';
import 'package:flutter/material.dart';

import 'package:components/src/providers/menu_provider.dart';
import 'package:components/src/utils/icon_string_utils.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Componente"),
      ),
      body: _lista(),
    );
  }

  Widget _lista() {
    return FutureBuilder(
      future: menuProvider.cargarData(),
      initialData: [],
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        final valor = snapshot.data;
        return ListView(
          children: _listarItems(valor!, context),
        );
      },
    );
  }

  List<Widget> _listarItems(List<dynamic> data, BuildContext context) {
    final List<Widget> opciones = [];

    data.forEach((element) {
      final WidgetTemp = ListTile(
        title: Text(element["texto"]),
        leading: getIcon(element["icon"]),
        trailing: Icon(
          Icons.access_alarm_outlined,
          color: Colors.blue,
        ),
        onTap: () {
          /*
          final route = MaterialPageRoute(builder: (context) => AlertsPage());
          Navigator.push(context, route);*/
          Navigator.pushNamed(context, element["ruta"]);
        },
      );
      opciones..add(WidgetTemp)..add(Divider());
    });
    return opciones;
  }
}
