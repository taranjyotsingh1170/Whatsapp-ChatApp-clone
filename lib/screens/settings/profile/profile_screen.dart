import 'package:flutter/material.dart';
import 'package:training/screens/settings/profile/change_name.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: Colors.green,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsetsDirectional.all(20),
            child: const CircleAvatar(
              radius: 90,
              backgroundImage: NetworkImage(
                'https://i.ibb.co/550GCHS/IMG-20210717-140111.jpg',
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Name'),
            subtitle: const Text('This is not your username or pin'),
            trailing: const Icon(Icons.edit),
            onTap: () {
              showModalBottomSheet(
                  context: context, builder: (_) => const ChangeName());
            },
          ),
          const Divider(),
          const ListTile(
            leading: Icon(Icons.person),
            title: Text('About'),
            subtitle: Text('Hey there! I am using WhatsApp'),
            trailing: Icon(Icons.edit),
          ),
          const Divider(),
          const ListTile(
            leading: Icon(Icons.call),
            title: Text('Phone'),
          ),
        ],
      ),
    );
  }
}
