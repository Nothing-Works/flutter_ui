import 'package:flutter/material.dart';
import 'package:flutter_ui/src/apps/ui/widgets/text.dart';

class UiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('UI App'),
        ),
        body: Center(
          child: UiText(),
        ),
      ),
    );
  }
}
