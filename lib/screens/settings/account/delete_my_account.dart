import 'package:flutter/material.dart';

class DeleteMyAccount extends StatelessWidget {
  const DeleteMyAccount({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Delete my account'),
        elevation: 0,
        backgroundColor: const Color(0xFF075e54),
      ),
    );
  }
}