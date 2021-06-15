import 'package:flutter/material.dart';

import 'dart:math';

class AnimatedContainerPage extends StatefulWidget {
  @override
  _AnimatedContainerPageState createState() => _AnimatedContainerPageState();
}

class _AnimatedContainerPageState extends State<AnimatedContainerPage> {
  double _width = 50.0;
  double _height = 50.0;
  Color _color = Colors.pink;

  BorderRadius _borderRadius = BorderRadius.circular(8.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.change_circle),
        onPressed: () => _change_data(),
      ),
      appBar: AppBar(
        title: Text("Animated Cotainer"),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: Duration(seconds: 1),
          curve: Curves.easeInBack,
          width: _width,
          height: _height,
          decoration: BoxDecoration(borderRadius: _borderRadius, color: _color),
        ),
      ),
    );
  }

  void _change_data() {
    final random = Random();
    setState(() {
      _height = random.nextInt(300).toDouble();
      _width = random.nextInt(300).toDouble();
      if (_width < 0) {
        _width = 0;
      }
      if (_height < 0) {
        _height = 0;
      }
      _color = Color.fromARGB(
          random.nextInt(255), random.nextInt(255), random.nextInt(255), 1);
      _borderRadius = BorderRadius.circular(random.nextInt(100).toDouble());
    });
  }
}
