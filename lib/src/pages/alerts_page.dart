import 'package:flutter/material.dart';

class AlertsPage extends StatelessWidget {
  //const name({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Alerts Page"),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text("Mostrar Alert"),
          onPressed: () => _mostrarAlert(context),
          style: ElevatedButton.styleFrom(
              primary: Colors.blue, shape: StadiumBorder()),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Icon(Icons.arrow_back),
      ),
    );
  }

  void _mostrarAlert(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            title: Text("Titulo de la Alerta"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text("Este es el contenido de la alerta por favor no chinguen"),
                FlutterLogo(
                  size: 100.0,
                )
              ],
            ),
            actions: <Widget>[
              TextButton(
                child: Text("Cancelar"),
                onPressed: () => Navigator.of(context).pop(),
              ),
              TextButton(
                child: Text("Ok"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }
}
