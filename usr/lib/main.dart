import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CIPACA Healthcare Newsletter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF005A9C),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF005A9C),
          secondary: const Color(0xFFE53935),
        ),
        textTheme: const TextTheme(
          displayLarge: TextStyle(
              fontSize: 48.0, fontWeight: FontWeight.bold, color: Colors.white),
          headlineMedium: TextStyle(
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
              color: Color(0xFF005A9C)),
          bodyLarge: TextStyle(fontSize: 16.0, height: 1.5),
          bodyMedium: TextStyle(fontSize: 14.0, height: 1.4),
        ),
        useMaterial3: true,
      ),
      home: const NewsletterScreen(),
    );
  }
}

class NewsletterScreen extends StatelessWidget {
  const NewsletterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(context),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildIntroSection(),
                  const SizedBox(height: 32),
                  _buildSection(
                    context,
                    icon: Icons.article,
                    title: "From the MD's Desk",
                    content:
                        "Pioneering Progress in Rural Healthcare. Our mission aligns seamlessly with our motto: Saving Lives, Saving Costs. This commitment has driven every milestone we've achieved...",
                    imageUrl: 'https://images.unsplash.com/photo-1576091160550-2173dba999ef?q=80&w=2070',
                  ),
                  _buildSection(
                    context,
                    icon: Icons.handshake,
                    title: "Partner Hospital Collaborations",
                    content:
                        "Our commitment to making critical care accessible across rural India is fortified through strategic collaborations with hospitals, enabling us to establish state-of-the-art ICUs in remote areas.",
                    imageUrl: 'https://images.unsplash.com/photo-1527613426441-4da17471b66d?q=80&w=2070',
                  ),
                   _buildSection(
                    context,
                    icon: Icons.people_alt,
                    title: "Community Activities & CSR",
                    content:
                        "Our community outreach programs, health camps, and Corporate Social Responsibility (CSR) activities serve as the foundation of our mission to bridge healthcare disparities.",
                    imageUrl: 'https://images.unsplash.com/photo-1532629345422-7515f3d16bb6?q=80&w=2070',
                  ),
                  _buildSection(
                    context,
                    icon: Icons.star,
                    title: "Awards & Recognitions",
                    content:
                        "Proudly standing as India's Largest Rural ICU Care Provider, CIPACA has received commendations for the sheer number of lives saved and for its unrivaled critical care training programs.",
                    imageUrl: 'https://images.unsplash.com/photo-1560419356-648946705b64?q=80&w=2070',
                  ),
                  _buildEmployeeSpotlight(context),
                  _buildMetrics(context),
                ],
              ),
            ),
            _buildFooter(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
      child: Center(
        child: Column(
          children: [
            Text(
              'CIPACA Healthcare Newsletter',
              style: Theme.of(context).textTheme.displayLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              'November 2025',
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(color: Colors.white70),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIntroSection() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.lightBlue.shade50,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Saving Lives, Saving Costs',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.red.shade700,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            "India's Largest Rural ICU Provider",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.blue.shade800,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Delivering world-class critical care to rural communities across India.',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey.shade800,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection(BuildContext context,
      {required IconData icon,
      required String title,
      required String content,
      required String imageUrl}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 32.0),
      child: Card(
        elevation: 4,
        shadowColor: Colors.black26,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
              child: Image.network(
                imageUrl,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  height: 200,
                  color: Colors.grey[300],
                  child: const Icon(Icons.broken_image, size: 50, color: Colors.grey),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(icon, color: Theme.of(context).primaryColor, size: 32),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(title,
                            style: Theme.of(context).textTheme.headlineMedium),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(content, style: Theme.of(context).textTheme.bodyLarge),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  Widget _buildEmployeeSpotlight(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.only(bottom: 32),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      color: Colors.blue.shade50,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            const CircleAvatar(
              radius: 40,
              backgroundColor: Colors.white,
              backgroundImage: NetworkImage('https://images.unsplash.com/photo-1582750433449-648ed127bb54?q=80&w=1974'),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Employee Spotlight", style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 22)),
                  const SizedBox(height: 8),
                  Text("Dr. Keshav Singhal, a visionary leader in Orthopaedic Care, is our CIPACAITE of the Month.", style: Theme.of(context).textTheme.bodyLarge),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
  
  Widget _buildMetrics(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Metrics & Achievements", style: Theme.of(context).textTheme.headlineMedium),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildMetricItem(context, "500+", "ICU Beds Operationalized"),
            _buildMetricItem(context, "10+", "States with ICUs Established"),
            _buildMetricItem(context, "10k+", "Hours of Critical Care Training"),
          ],
        ),
      ],
    );
  }

  Widget _buildMetricItem(BuildContext context, String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 14, color: Colors.black54),
        ),
      ],
    );
  }

  Widget _buildFooter(BuildContext context) {
    return Container(
      color: Colors.grey.shade800,
      padding: const EdgeInsets.all(24),
      child: Center(
        child: Column(
          children: [
            const Text(
              'Thank you for being part of the CIPACA family!',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              'For more information, visit www.cipaca.com or contact us at info@cipaca.com',
              style: TextStyle(color: Colors.grey.shade400, fontSize: 14),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
