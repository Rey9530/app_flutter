import 'dart:ffi';

import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  SliderPage({Key? key}) : super(key: key);

  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _valorSlider = 0.00;
  bool _bloqueCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Slider"),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 30.0),
        child: Column(
          children: [
            _crear_slider(),
            _crearCheck(),
            _crearShiwch(),
            Expanded(
              child: _cargarIamgen(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _crear_slider() {
    return Slider(
      activeColor: Colors.cyan,
      label: "Tamano de la imagen",
      value: _valorSlider,
      min: 0.00,
      max: 400.00,
      onChanged: (_bloqueCheck)
          ? null
          : (valor) {
              setState(() {
                _valorSlider = valor;
              });
            },
    );
  }

  Widget _cargarIamgen() {
    return Image(
      image: NetworkImage("https://wallpaperaccess.com/full/2647247.jpg"),
      width: _valorSlider,
      fit: BoxFit.contain,
    );
  }

  Widget _crearCheck() {
    /*return Checkbox(
      value: _bloqueCheck,
      onChanged: (response) {
        setState(() {
          _bloqueCheck = response!;
        });
      },
    );*/
    return CheckboxListTile(
      value: _bloqueCheck,
      title: Text("Bloquear Slider"),
      onChanged: (response) {
        setState(() {
          _bloqueCheck = response!;
        });
      },
    );
  }

  Widget _crearShiwch() {
    return SwitchListTile(
      value: _bloqueCheck,
      title: Text("Bloquear Slider"),
      onChanged: (response) {
        setState(() {
          _bloqueCheck = response;
        });
      },
    );
  }
}
