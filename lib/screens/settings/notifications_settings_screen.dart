import 'package:flutter/material.dart';

class NotificationsSettingsScreen extends StatelessWidget {
  const NotificationsSettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
        elevation: 0,
        backgroundColor: const Color(0xFF075e54),
        actions: [
          PopupMenuButton(
            itemBuilder: (_) => [
              const PopupMenuItem(
                child: Text('Reset notification settings'),
                value: 1
              ),
            ],
          ),
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
            child: SwitchListTile(
              value: false,
              onChanged: (bool value) {},
              title: const Text('Conversation tones'),
              subtitle:
                  const Text('Play sounds for incoming and outgoing messages'),
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: Text(
                    'Messages',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                const ListTile(
                  title: Text('Notification tone'),
                  subtitle: Text('Default (Spaceline)'),
                ),
                const ListTile(
                  title: Text('Vibrate'),
                  subtitle: Text('Default'),
                ),
                const ListTile(
                  title: Text('Light'),
                  subtitle: Text('White'),
                ),
                SwitchListTile(
                  value: false,
                  onChanged: (bool value) {},
                  title: const Text('Use high priority notifications'),
                  subtitle: const Text(
                      'Show previews of notifications at the top of the screen'),
                ),
              ],
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: Text(
                    'Groups',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                const ListTile(
                  title: Text('Notification tone'),
                  subtitle: Text('Default (Spaceline)'),
                ),
                const ListTile(
                  title: Text('Vibrate'),
                  subtitle: Text('Default'),
                ),
                const ListTile(
                  title: Text('Light'),
                  subtitle: Text('White'),
                ),
                SwitchListTile(
                  value: false,
                  onChanged: (bool value) {},
                  title: const Text('Use high priority notifications'),
                  subtitle: const Text(
                      'Show previews of notifications at the top of the screen'),
                ),
              ],
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                  child: Text(
                    'Calls',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                ListTile(
                  title: Text('Ringtone'),
                  subtitle: Text('Default (Sunlight)'),
                ),
                ListTile(
                  title: Text('Vibrate'),
                  subtitle: Text('Default'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
