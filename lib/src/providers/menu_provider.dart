import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class _MenuProvider {
  List<dynamic> opciones = [];

  _MenuProvider();

  Future<List<dynamic>> cargarData() async {
    /*rootBundle.loadString("data/menu_opts.json").then((data) {
      Map dataMap = json.decode(data);
      print(dataMap["rutas"]);
    });*/

    final resp = await rootBundle.loadString("data/menu_opts.json");
    Map dataMap = json.decode(resp);
    opciones = dataMap["rutas"];
    return dataMap["rutas"];
  }
}

final menuProvider = new _MenuProvider();
