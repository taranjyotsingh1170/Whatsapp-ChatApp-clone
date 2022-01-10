import 'package:flutter/material.dart';

class LiveLocation extends StatelessWidget {
  const LiveLocation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Live Location'),
        elevation: 0,
        backgroundColor: const Color(0xFF075e54),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 45),
          const CircleAvatar(
            child: Icon(Icons.location_on_sharp, size: 50,),
            radius: 50,
          ),
          const SizedBox(height: 20),
          const Text('You aren\'t sharing live location in any chats', style: TextStyle(fontSize: 16),),
          const SizedBox(height: 25),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: const Text(
                'Live location requires background location. You can manage this in your device settings.'),
          ),
        ],
      ),
    );
  }
}
