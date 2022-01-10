//import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Security extends StatelessWidget {
  const Security({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Security'),
        elevation: 0,
        backgroundColor: const Color(0xFF075e54),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          CircleAvatar(
            radius: 50,
            backgroundColor: Colors.grey[350],
            child: const Icon(
              Icons.lock_rounded,
              size: 50,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(12),
            child: RichText(
              text: TextSpan(
                children: [
                  const TextSpan(
                    text:
                        'WhatsApp secures your conversations with end-to-end encryption. This means your messages, calls and status updates stay between you and the people you choose. Not even WhatsApp can read or listen to them.',
                  style: TextStyle(color: Colors.black, fontSize: 19),
                  ),
                  TextSpan(text: ' Learn more', style: const TextStyle(color: Colors.blue, fontSize: 19) ,onEnter: (value) {Navigator.of(context).pop();}),
                ],
              ),
            ),
          ),
          const Divider(),
          const SizedBox(height: 10),
          SwitchListTile(
            value: false,
            onChanged: (bool value) {},
            title: const Text('Show security notifications'),
            subtitle: const SizedBox(
              width: double.maxFinite,
              child: Text(
                  'Get notified when your security code changes for a contact.'),
            ),
          )
        ],
      ),
    );
  }
}
