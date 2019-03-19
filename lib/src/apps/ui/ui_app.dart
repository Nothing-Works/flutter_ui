import 'package:flutter/material.dart';

class UiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('UI App'),
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Image.asset('assets/images/pic1.jpg'),
              Image.asset('assets/images/pic2.jpg'),
              Image.asset('assets/images/pic3.jpg'),
            ],
          ),
        ),
      ),
    );
  }
}
