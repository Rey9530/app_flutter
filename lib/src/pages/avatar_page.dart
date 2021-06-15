import 'package:flutter/material.dart';

class AvatartPage extends StatelessWidget {
  //const name({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Avatart Page"),
        actions: [
          Container(
            padding: EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://i.pinimg.com/originals/fc/4b/1a/fc4b1a434102bb6f3af26c224cd5179f.jpg"),
              radius: 25.0,
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              child: Text("SL"),
              backgroundColor: Colors.blue[900],
            ),
          )
        ],
      ),
      body: Center(
        child: FadeInImage(
          image: NetworkImage(
              "https://i.pinimg.com/originals/fc/4b/1a/fc4b1a434102bb6f3af26c224cd5179f.jpg"),
          placeholder: AssetImage("assets/jar-loading.gif"),
          fadeInDuration: Duration(milliseconds: 200),
        ),
      ),
    );
  }
}
