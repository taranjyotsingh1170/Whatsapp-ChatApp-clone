import 'package:flutter/material.dart';

class FingerprintLock extends StatelessWidget {
  const FingerprintLock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fingerprint lock'),
        elevation: 0,
        backgroundColor: const Color(0xFF075e54),
      ),
      body: Column(
        children: [
          const SizedBox(height: 17,),
          SwitchListTile(
            value: false,
            onChanged: (bool value) {},
            title: const Text('Unlock with fingerprint'),
            subtitle: const Text(
                'When enabled, you\'ll need to use fingerprint to open WhatsApp. You can still answer calls if WhatsApp is locked'),
          ),
        ],
      ),
    );
  }
}
