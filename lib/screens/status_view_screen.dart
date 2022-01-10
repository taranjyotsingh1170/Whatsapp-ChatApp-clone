import 'package:flutter/material.dart';

class StatusViewScreen extends StatelessWidget {
  const StatusViewScreen({Key? key}) : super(key: key);

  static const routeName = '/full-status-screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const ListTile(
          contentPadding: EdgeInsets.zero,
          leading: CircleAvatar(
            radius: 23,
            backgroundImage: NetworkImage('https://go.nature.com/3Cme4uc'),
          ),
          title: Text('My status'),
          subtitle: Text('Yesterday, 9:22 pm'),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        color: Colors.black,
        child: Center(
          child: Image.network('https://c.stocksy.com/a/27d300/z9/865336.jpg'),
        ),
      ),
    );
  }
}
