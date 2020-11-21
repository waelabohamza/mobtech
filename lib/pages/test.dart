import 'package:flutter/material.dart';


class Fmessging extends StatefulWidget {
  Fmessging({Key key}) : super(key: key);

  @override
  _FmessgingState createState() => _FmessgingState();
}

class _FmessgingState extends State<Fmessging> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('notifcaation'),
      ),
      body: Container(child: Text("notfiy"),),
    );
  }
}

// get Token 
// fcm 
// permission 