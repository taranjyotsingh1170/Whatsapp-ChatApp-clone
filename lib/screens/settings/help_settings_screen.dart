import 'package:flutter/material.dart';

class HelpSettings extends StatelessWidget {
  const HelpSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help'),
        elevation: 0,
        backgroundColor: const Color(0xFF075e54),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: const [
            ListTile(
              leading: Icon(Icons.help_outline),
              title: Text('Help Centre'),
            ),
            ListTile(
              leading: Icon(Icons.people),
              title: Text('Contact us'),
              subtitle: Text('Questions? Need help?'),
            ),
            ListTile(
              leading: Icon(Icons.note_add),
              title: Text('Terms and Privacy Policy'),
            ),
            ListTile(
              leading: Icon(Icons.info_outline),
              title: Text('App info'),
            ),
          ],
        ),
      ),
    );
  }
}
