import 'package:flutter/material.dart';
import 'package:training/screens/status_list_screen.dart';
import 'package:training/screens/status_view_screen.dart';

class StatusScreen extends StatelessWidget {
  const StatusScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            child: ListTile(
              leading: const CircleAvatar(
                radius: 25,
                backgroundImage: NetworkImage('https://go.nature.com/3Cme4uc'),
              ),
              title: const Text(
                'My status',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: const Text('Yesterday, 9:22 pm'),
              trailing: GestureDetector(
                child: const Icon(Icons.more_horiz_outlined),
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) {
                    return const StatusListScreen();
                  }),
                ),
              ),
              onTap: () =>
                  Navigator.of(context).pushNamed(StatusViewScreen.routeName),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            width: double.infinity,
            color: Colors.grey[300],
            margin: const EdgeInsets.symmetric(horizontal: 4),
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
            child: const Text(
              'Recent updates',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            autofocus: true,
            child: const Icon(Icons.edit, color: Colors.brown),
            onPressed: (){},
            backgroundColor: Colors.white,
            
          ),
          const SizedBox(height: 15),
          FloatingActionButton(
            
            child: const Icon(Icons.camera_alt),
            onPressed: (){},
            backgroundColor: Colors.amber,
            splashColor: Colors.white,
            
          ),
        ],
      ),
    );
  }
}
