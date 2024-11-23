import 'package:flutter/material.dart';

class ImpactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Our Impact')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Impact Overview', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text(
              'Over the past 3 years, we have achieved:',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text('- Educated 10,000 children.', style: TextStyle(fontSize: 16)),
            Text('- Conducted 50+ free health camps.', style: TextStyle(fontSize: 16)),
            Text('- Empowered 1,000 women with job-ready skills.', style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
