import 'package:flutter/material.dart';

class ChangeName extends StatelessWidget {
  const ChangeName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Text(
          'Enter your name',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
