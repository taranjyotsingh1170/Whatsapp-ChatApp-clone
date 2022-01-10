
import 'package:flutter/material.dart';

class TwoStepVerification extends StatelessWidget {
  const TwoStepVerification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Two-step verification'),
        elevation: 0,
        backgroundColor: const Color(0xFF075e54),
      ),
      body: Column(
        children: [
          const SizedBox(height: 45),
          CircleAvatar(
            radius: 50,
            backgroundColor: Colors.grey[350],
            child: const Icon(
              Icons.more_horiz_rounded,
              size: 50,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 20),
          const ListTile(
            subtitle: Text(
              'For added security enable two-step verification, which will require a PIN when registering your phone number with WhatsApp again.',
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.only(bottom: 10),
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('ENABLE'),
              style: ElevatedButton.styleFrom(
                shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                elevation: 2,
              ),
              
            ),
          ),
        ],
      ),
    );
  }
}
