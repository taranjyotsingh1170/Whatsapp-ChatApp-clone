import 'package:flutter/material.dart';

class ChangeNumber extends StatelessWidget {
  const ChangeNumber({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Change number'),
        elevation: 0,
        backgroundColor: const Color(0xFF075e54),
      ),
      body: Column(
        children: const [
          SizedBox(height: 25),
          SizedBox(
            child: CircleAvatar(
              radius: 50,
              child: Icon(
                Icons.sim_card,
                size: 50,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(height: 25),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
                'Changing your phone number will migrate your account info, groups & settings.'),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {},
              child: const Text('NEXT'),
              style: ElevatedButton.styleFrom(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
