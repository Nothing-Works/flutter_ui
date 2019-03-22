import 'package:flutter/material.dart';
import 'package:flutter_ui/src/apps/bloc_vanilla/ui/post.dart';

class BlocVanilla extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PostBloc(),
    );
  }
}
