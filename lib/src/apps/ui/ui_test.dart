import 'package:flutter/material.dart';

class UiTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Ui Test'),
        ),
        body: Container(
          color: Colors.red,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                color: Colors.green,
                child: Text('test'),
              ),
              Container(
                color: Colors.green,
                child: Text('test'),
              ),
              Container(
                color: Colors.green,
                child: Text('test'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
