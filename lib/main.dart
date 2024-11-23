import 'package:enlighten_vision_website/home/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(EnlightenVisionApp());
}

class EnlightenVisionApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Enlighten Vision Society',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
