import 'package:flutter/material.dart';

class UiImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'asstes/image/facebook.png',
      fit: BoxFit.cover,
    );
  }
}
