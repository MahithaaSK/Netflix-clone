import 'package:flutter/material.dart';
import 'package:sow/home.dart';
class HelpPage extends StatefulWidget {
  const HelpPage({super.key});

  @override
  State<HelpPage> createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
     child:  Scaffold(
      backgroundColor: Color.fromARGB(255, 15, 14, 14),
      appBar: AppBar(
        title: const Text('Get Help',style: TextStyle(color: Colors.white),),
        backgroundColor: Color.fromARGB(255, 12, 12, 12),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context,
                  MaterialPageRoute(builder: (context) => const Netflix()));
            },
            icon: const Icon(Icons.arrow_back_ios_new_outlined,color: Colors.white,)),
 ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const Text(
              'How can we help you?',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 244, 233, 233),
              ),
            ),
            const SizedBox(height: 20),
            _buildHelpItem(
              icon: Icons.live_help,
              title: 'FAQ',
              description: 'Find answers to the most frequently asked questions.',
              onTap: () {
              },
            ),
            _buildHelpItem(
              icon: Icons.contact_support,
              title: 'Contact Support',
              description: 'Get in touch with our support team for assistance.',
              onTap: () {
              },
            ),
            _buildHelpItem(
              icon: Icons.feedback,
              title: 'Give Feedback',
              description: 'Share your thoughts and suggestions with us.',
              onTap: () {
              },
            ),
            _buildHelpItem(
              icon: Icons.policy,
              title: 'Privacy Policy',
              description: 'Learn more about our privacy practices.',
              onTap: () {
              },
            ),
            _buildHelpItem(
              icon: Icons.security,
              title: 'Terms of Service',
              description: 'Read our terms and conditions.',
              onTap: () {
              },
            ),
          ],
        ),
      ),
    ),
    );
  }

  Widget _buildHelpItem({
    required IconData icon,
    required String title,
    required String description,
    required VoidCallback onTap,
  }) {
    return Card(
      color: const Color.fromARGB(255, 89, 82, 82).withOpacity(0.3),
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        leading: Icon(icon, color: Color.fromARGB(255, 230, 91, 81)),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white
          ),
        ),
        subtitle: Text(description,style: TextStyle(color: Colors.white),),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: onTap,
      ),
    );
  }
}
