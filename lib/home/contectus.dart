import 'package:flutter/material.dart';

class ContactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Contact Us')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Contact Enlighten Vision Society', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text('Email: info@enlightenvision.org', style: TextStyle(fontSize: 16)),
            Text('Phone: +91 9876543210', style: TextStyle(fontSize: 16)),
            Text('Address: 123 Trust Lane, City, Country', style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
