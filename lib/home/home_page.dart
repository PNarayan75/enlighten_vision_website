import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final ScrollController _scrollController = ScrollController();

  // Section Keys
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _impactKey = GlobalKey();
  final GlobalKey _galleryKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Enlighten Vision Society'),
        actions: [
          _navButton(context, 'About Us', _aboutKey),
          _navButton(context, 'Projects', _projectsKey),
          _navButton(context, 'Impact', _impactKey),
          _navButton(context, 'Gallery', _galleryKey),
          _navButton(context, 'Contact Us', _contactKey),
        ],
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            _headerSection(),
            _section(_aboutKey, 'About Us', _missionContent()),
            _section(_projectsKey, 'Our Projects', _projectsContent()),
            _section(_impactKey, 'Our Impact', _impactContent()),
            _section(_galleryKey, 'Gallery', _galleryContent()),
            _section(_contactKey, 'Contact Us', _contactContent()),
          ],
        ),
      ),
    );
  }

  /// Navigation Button
  Widget _navButton(BuildContext context, String label, GlobalKey sectionKey) {
    return TextButton(
      onPressed: () => _scrollToSection(sectionKey),
      child: Text(label, style: const TextStyle(color: Colors.white)),
    );
  }

  /// Scroll to Section
  void _scrollToSection(GlobalKey sectionKey) {
    final context = sectionKey.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  /// Header Section with Carousel
  Widget _headerSection() {
    final List<String> imageUrls = [
      'https://visiongroup.in/images/gallery/img-1.jpg',
      'https://via.placeholder.com/800x400',
      'https://via.placeholder.com/800x400',
    ];

    return Stack(
      children: [
        CarouselSlider(
          items: imageUrls.map((url) {
            return Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(url),
                  fit: BoxFit.cover,
                ),
              ),
            );
          }).toList(),
          options: CarouselOptions(
            height: 300,
            viewportFraction: 1.0,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: false,
          ),
        ),
        Container(
          height: 300,
          color: Colors.black.withOpacity(0.4), // Overlay for text visibility
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Empowering Communities for a Better Tomorrow',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  ),
                  child: const Text('Get Involved', style: TextStyle(fontSize: 18)),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  /// Section Widget
  Widget _section(GlobalKey key, String title, Widget content) {
    return Container(
      key: key,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          content,
        ],
      ),
    );
  }

  /// Mission Content
  Widget _missionContent() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Our Mission',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(Icons.lightbulb_outline, size: 40, color: Colors.blue),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  'Enlighten Vision Society is dedicated to uplifting underprivileged communities through education, healthcare, and empowerment initiatives. Our mission is to ensure that every individual has access to the resources and opportunities they need to succeed.',
                  style: TextStyle(fontSize: 16, color: Colors.grey[800]),
                  textAlign: TextAlign.justify,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Text(
            'Key Focus Areas:',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _focusPoint(Icons.school, 'Education for all: Free education for underprivileged children.'),
              _focusPoint(Icons.health_and_safety, 'Healthcare access: Free health camps in rural areas.'),
              _focusPoint(Icons.woman, 'Women empowerment: Promoting skill development for women.'),
              _focusPoint(Icons.nature_people, 'Sustainability: Conducting environmental awareness programs.'),
            ],
          ),
        ],
      ),
    );
  }

  /// Focus Point Widget
  Widget _focusPoint(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.blue, size: 24),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: TextStyle(fontSize: 16, color: Colors.grey[800]),
            ),
          ),
        ],
      ),
    );
  }

  /// Projects Content
  Widget _projectsContent() {
    final List<Map<String, String>> projects = [
      {
        'title': 'Education for All',
        'description': 'Free education for underprivileged children.',
        'icon': 'https://via.placeholder.com/150',
      },
      {
        'title': 'Health Camps',
        'description': 'Free health check-ups in rural areas.',
        'icon': 'https://via.placeholder.com/150',
      },
      {
        'title': 'Women Empowerment',
        'description': 'Skill development for women.',
        'icon': 'https://via.placeholder.com/150',
      },
      {
        'title': 'Environmental Awareness',
        'description': 'Tree plantation drives and sustainability campaigns.',
        'icon': 'https://via.placeholder.com/150',
      },
      {
        'title': 'Food Distribution',
        'description': 'Providing essential food supplies to families in need.',
        'icon': 'https://via.placeholder.com/150',
      },
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: projects.map((project) {
          return _projectCard(
            project['title']!,
            project['description']!,
            project['icon']!,
          );
        }).toList(),
      ),
    );
  }

  /// Project Card Widget
  Widget _projectCard(String title, String description, String imageUrl) {
    return Container(
      width: 200,
      margin: const EdgeInsets.only(right: 16),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
              child: Image.network(
                imageUrl,
                height: 120,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: const TextStyle(
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

  /// Impact Content
  Widget _impactContent() {
    final List<Map<String, dynamic>> impactData = [
      {
        'icon': Icons.school,
        'title': 'Educated Children',
        'value': '10,000+',
        'description': 'Providing quality education to underprivileged children.',
      },
      {
        'icon': Icons.health_and_safety,
        'title': 'Health Camps Conducted',
        'value': '50+',
        'description': 'Organized free health check-ups in rural areas.',
      },
      {
        'icon': Icons.woman,
        'title': 'Women Empowered',
        'value': '1,000+',
        'description': 'Empowered women with job-ready skills.',
      },
      {
        'icon': Icons.nature_people,
        'title': 'Environmental Campaigns',
        'value': '25+',
        'description': 'Promoted sustainability through tree plantation drives.',
      },
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 1.2,
      ),
      itemCount: impactData.length,
      itemBuilder: (context, index) {
        final data = impactData[index];
        return _impactCard(
          data['icon'],
          data['title'],
          data['value'],
          data['description'],
        );
      },
    );
  }

  /// Impact Card Widget
  Widget _impactCard(IconData icon, String title, String value, String description) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.blue.withOpacity(0.1),
                  child: Icon(icon, color: Colors.blue, size: 30),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      value,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                    Text(
                      title,
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(description, style: const TextStyle(fontSize: 14, color: Colors.grey)),
          ],
        ),
      ),
    );
  }

  /// Gallery Content
  Widget _galleryContent() {
    final List<Map<String, String>> galleryItems = [
      {
        'imageUrl': 'https://visiongroup.in/images/gallery/img-1.jpg',
        'title': 'Health Camp',
        'description': 'A health camp organized in rural areas.',
      },
      {
        'imageUrl': 'https://via.placeholder.com/150',
        'title': 'Education Drive',
        'description': 'Providing quality education to underprivileged children.',
      },
      {
        'imageUrl': 'https://via.placeholder.com/150',
        'title': 'Tree Plantation',
        'description': 'Planting trees to promote environmental awareness.',
      },
      {
        'imageUrl': 'https://via.placeholder.com/150',
        'title': 'Women Empowerment',
        'description': 'Training women in job-ready skills.',
      },
      {
        'imageUrl': 'https://via.placeholder.com/150',
        'title': 'Food Distribution',
        'description': 'Helping families in need with essential food supplies.',
      },
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 3 / 4,
      ),
      itemCount: galleryItems.length,
      itemBuilder: (context, index) {
        final item = galleryItems[index];
        return _galleryCard(item['imageUrl']!, item['title']!, item['description']!);
      },
    );
  }

  /// Gallery Card Widget
  Widget _galleryCard(String imageUrl, String title, String description) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: Image.network(
              imageUrl,
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              description,
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }

  /// Contact Content
  Widget _contactContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Phone: +91 9876543210', style: TextStyle(fontSize: 16)),
        const Text('Email: info@enlightenvision.org', style: TextStyle(fontSize: 16)),
        const Text('Address: 123 Street Name, City, State, Country',
            style: TextStyle(fontSize: 16)),
        const SizedBox(height: 10),
        ElevatedButton(onPressed: () {}, child: const Text('Get in Touch')),
      ],
    );
  }
}
