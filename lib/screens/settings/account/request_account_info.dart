import 'package:flutter/material.dart';

class RequestAccountInfo extends StatelessWidget {
  const RequestAccountInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Request account info'),
        elevation: 0,
        backgroundColor: const Color(0xFF075e54),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          SizedBox(
            child: CircleAvatar(
              radius: 50,
              backgroundColor: Colors.grey[350],
              child: const Icon(
                Icons.document_scanner,
                size: 50,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 20),
          const ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 25),
            title: Text(
              'Create a report of your WhatsApp account information and settings, which you can access or port to another app. This report does not include your messages.',
            ),
          ),
          const Divider(),
         /*Expanded(
            child: Container(

              width: MediaQuery.of(context).size.width,
              child: Row(
                children: const [
                  Icon(Icons.access_time),
                  ListTile(
                    title: Text('Request Sent'),
                    subtitle: Text('Ready by 23 September 2021'),
                  ),
                ],
              ),
            ),
          ),*/
          const Divider(),
        ],
      ),
    );
  }
}
