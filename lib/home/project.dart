import 'package:flutter/material.dart';

Widget _projectsContent() {
  final List<Map<String, String>> projects = [
    {
      'title': 'Education for All',
      'description': 'Free education for underprivileged children.',
      'icon': 'https://via.placeholder.com/150', // Replace with actual image URL
    },
    {
      'title': 'Health Camps',
      'description': 'Free health check-ups in rural areas.',
      'icon': 'https://via.placeholder.com/150', // Replace with actual image URL
    },
    {
      'title': 'Women Empowerment',
      'description': 'Skill development for women.',
      'icon': 'https://via.placeholder.com/150', // Replace with actual image URL
    },
    {
      'title': 'Environmental Awareness',
      'description': 'Tree plantation drives and sustainability campaigns.',
      'icon': 'https://via.placeholder.com/150', // Replace with actual image URL
    },
    {
      'title': 'Food Distribution',
      'description': 'Providing essential food supplies to families in need.',
      'icon': 'https://via.placeholder.com/150', // Replace with actual image URL
    },
  ];

  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Our Projects',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 20),
        LayoutBuilder(
          builder: (context, constraints) {
            final isMobile = constraints.maxWidth < 600;

            return GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: isMobile ? 1 : 2, // Single column for mobile, two for larger screens
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: isMobile ? 3 / 2 : 4 / 3, // Adjust card height
              ),
              itemCount: projects.length,
              itemBuilder: (context, index) {
                final project = projects[index];
                return _projectCard(
                  project['title']!,
                  project['description']!,
                  project['icon']!,
                );
              },
            );
          },
        ),
      ],
    ),
  );
}

Widget _projectCard(String title, String description, String imageUrl) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 6,
          offset: Offset(0, 3),
        ),
      ],
    ),
    child: Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
            child: Image.network(
              imageUrl,
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return Center(
                  child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                            (loadingProgress.expectedTotalBytes ?? 1)
                        : null,
                  ),
                );
              },
              errorBuilder: (context, error, stackTrace) {
                return Icon(Icons.broken_image, size: 50, color: Colors.grey);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              description,
              style: TextStyle(fontSize: 14, color: Colors.grey[700]),
            ),
          ),
        ],
      ),
    ),
  );
}
