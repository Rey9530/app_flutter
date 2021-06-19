import 'package:flutter/material.dart';

import 'dart:async';

class ListPage extends StatefulWidget {
  ListPage({Key? key}) : super(key: key);

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  List<int> _listWidget = [];
  int _ultimoValor = 0;
  bool _isLoadin = false;

  ScrollController _scrollController = new ScrollController();

  @override
  void initState() {
    super.initState();
    _cargarImagen();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        //_cargarImagen();
        futurData();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List...."),
      ),
      body: Stack(
        children: [_crearList(), _crearLogin()],
      ),
    );
  }

  Widget _crearList() {
    return RefreshIndicator(
      onRefresh: obtenerPagina,
      child: ListView.builder(
        controller: _scrollController,
        itemCount: _listWidget.length,
        itemBuilder: (BuildContext context, int index) {
          final imagen = _listWidget[index];
          return FadeInImage(
            image: NetworkImage('https://picsum.photos/500/300/?image=$imagen'),
            placeholder: AssetImage("assets/jar-loading.gif"),
          );
        },
      ),
    );
  }

  Future<Null> obtenerPagina() async {
    final duration = new Duration(seconds: 2);
    new Timer(duration, () {
      _listWidget.clear();
      _ultimoValor++;
      _cargarImagen();
    });
    return Future.delayed(duration);
  }

  void _cargarImagen() {
    for (int i = 1; i <= 10; i++) {
      _ultimoValor++;
      _listWidget.add(_ultimoValor);
    }
    setState(() {});
  }

  Future futurData() async {
    _isLoadin = true;
    setState(() {});
    final duration = new Duration(seconds: 2);
    return new Timer(duration, respuestaHTTP);
  }

  void respuestaHTTP() {
    _isLoadin = false;

    _scrollController.animateTo(
      _scrollController.position.pixels + 100,
      duration: Duration(seconds: 2),
      curve: Curves.fastOutSlowIn,
    );

    _cargarImagen();
  }

  Widget _crearLogin() {
    if (_isLoadin) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
            ],
          ),
          SizedBox(
            height: 15.0,
          ),
        ],
      );
    } else {
      return Container();
    }
  }
}
