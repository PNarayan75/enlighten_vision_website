import 'package:flutter/material.dart';

class GalleryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Gallery')),
      body: GridView.count(
        crossAxisCount: 3,
        padding: const EdgeInsets.all(16.0),
        children: List.generate(6, (index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('assets/image${index + 1}.png', fit: BoxFit.cover),
          );
        }),
      ),
    );
  }
}
