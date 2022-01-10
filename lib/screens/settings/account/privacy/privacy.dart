import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:training/screens/settings/account/privacy/blocked_contacts_screen.dart';
import 'package:training/screens/settings/account/privacy/choices_screen.dart';
import 'package:training/screens/settings/account/privacy/fingerprint_lock_screen.dart';
import 'package:training/screens/settings/account/privacy/groups_settings_screen.dart';
import 'package:training/screens/settings/account/privacy/live_location.dart';

class Privacy extends StatelessWidget {
  const Privacy({Key? key}) : super(key: key);

  Widget alertBox(String title) {
    return AlertDialog(
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: const [
              Icon(Icons.circle_outlined),
              SizedBox(
                width: 10,
              ),
              Text('Everyone'),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            children: const [
              Icon(Icons.circle_outlined),
              SizedBox(
                width: 10,
              ),
              Text('My contacts'),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            children: const [
              Icon(Icons.circle_outlined),
              SizedBox(
                width: 10,
              ),
              Text('Nobody'),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Privacy'),
        elevation: 0,
        backgroundColor: const Color(0xFF075e54),
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          const ListTile(
            title: Text(
              'Who can see my personal info',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            contentPadding: EdgeInsets.only(bottom: 5, left: 15, right: 15),
            subtitle: Text(
                'If you don\'t share your Last Seen, you won\'t be able to see other people\'s Last Seen'),
          ),
          const SizedBox(height: 10),
          ListTile(
              title: const Text('Last Seen'),
              subtitle: const Text('Everyone'),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (_) {
                    return alertBox('Last Seen');
                  },
                );
              }),
          ListTile(
              title: const Text('Profile photo'),
              subtitle: const Text('Everyone'),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (_) {
                    return alertBox('Profile photo');
                  },
                );
              }),
          ListTile(
              title: const Text('About'),
              subtitle: const Text('Everyone'),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (_) {
                    return alertBox('About');
                  },
                );
              }),
          ListTile(
            title: const Text('Status'),
            subtitle: const Text('My contacts'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                return const ChoicesScreen(
                  appBarTitle: 'Status privacy',
                  topTitle: 'Who can see my status updates',
                  endInstruction:
                      'Changes to your privacy settings won\' affect status updates that you\'ve sent already',
                );
              }));
            },
          ),
          SwitchListTile(
            value: false,
            onChanged: (bool value) {},
            title: const Text('Read receipts'),
            subtitle: const Text(
                'If turned off, you won\'t send or receive Read receipts. Read receipts are always sent for group chats'),
          ),
          const Divider(),
          ListTile(
            title: const Text('Groups'),
            subtitle: const Text('Everyone'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                return const GroupsSettingScreen(
                  appBarTitle: 'Groups',
                  topTitle: 'Who can add me to groups',
                  endInstruction:
                      'Admins who can\'t add you to a group will have the option of inviting you privately instead.',
                );
              }));
            },
          ),
          ListTile(
            title: const Text('Live location'),
            subtitle: const Text('Everyone'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                return const LiveLocation();
              }));
            },
          ),
          ListTile(
            title: const Text('Blocked contacts'),
            subtitle: const Text('Everyone'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                return const BlockedContacts();
              }));
            },
          ),
          ListTile(
            title: const Text('Fingerprint lock'),
            subtitle: const Text('Disabled'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                return const FingerprintLock();
              }));
            },
          ),
        ],
      ),
    );
  }
}
