import 'package:flutter/material.dart';

class ChoicesScreen extends StatelessWidget {
  const ChoicesScreen({
    Key? key,
    required this.topTitle,
    required this.endInstruction,
    required this.appBarTitle,
  }) : super(key: key);

  final String topTitle;
  final String endInstruction;
  final String appBarTitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle),
        elevation: 0,
        backgroundColor: const Color(0xFF075e54),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Text(
                topTitle,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                children: const [
                  Icon(Icons.circle_outlined),
                  SizedBox(
                    width: 20,
                  ),
                  Text('My contacts'),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                children: const [
                  Icon(Icons.circle_outlined),
                  SizedBox(
                    width: 20,
                  ),
                  Text('My contacts except...'),
                ],
              ),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                children: const [
                  Icon(Icons.circle_outlined),
                  SizedBox(
                    width: 20,
                  ),
                  Text('Only share with...'),
                ],
              ),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Text(endInstruction),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(bottom: 15),
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {Navigator.of(context).pop();},
              child: const Text('Done'),
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
