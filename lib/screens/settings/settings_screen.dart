import 'package:flutter/material.dart';
import 'package:training/screens/settings/account/account_settings_screen.dart';
import 'package:training/screens/settings/chats_settings_screen.dart';
import 'package:training/screens/settings/help_settings_screen.dart';
import 'package:training/screens/settings/notifications_settings_screen.dart';
import 'package:training/screens/settings/profile/profile_screen.dart';
import 'package:training/screens/settings/storage_data_settings_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  static const routeName = '/settings-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        elevation: 0,
        backgroundColor: const Color(0xFF075e54),
      ),
      body: Column(
        children: [
          const SizedBox(height: 7),
          ListTile(
            leading: const CircleAvatar(
              radius: 35,
              backgroundImage: NetworkImage(
                  'https://i.ibb.co/550GCHS/IMG-20210717-140111.jpg'),
            ),
            title: const Text('TJ'),
            subtitle: const Text('Hey there! I am using WhatsApp.'),
            trailing: const Icon(Icons.qr_code),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const ProfileScreen()),
              );
            },
          ),
          const Divider(),
          SizedBox(
            height: 360,
            child: ListView(
              children: [
                ListTile(
                  leading: const Icon(Icons.vpn_key),
                  title: const Text('Account'),
                  subtitle: const Text('Privacy, security, change number'),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => const AccountSettingsScreen()),
                    );
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.message),
                  title: const Text('Chats'),
                  subtitle: const Text('Theme, wallpapers, chat, history'),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => const ChatSettingsScreen()),
                    );
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.notifications),
                  title: const Text('Notifications'),
                  subtitle: const Text('Message, group, & call tones'),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => const NotificationsSettingsScreen()),
                    );
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.circle_outlined),
                  title: const Text('Storage and data'),
                  subtitle: const Text('Network usage, auto-download'),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => const StorageDataSettingsSCreen()),
                    );
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.help_outline),
                  title: const Text('Help'),
                  subtitle: const Text('Help centre, contact us, privacy policy'),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => const HelpSettings()),
                    );
                  },
                ),
              ],
            ),
          ),
          const Divider(),
          const ListTile(
            leading: Icon(Icons.people),
            title: Text('Invite a friend'),
          ),
          const SizedBox(height: 25),
          const Text('from'),
          const Text('FACEBOOK'),
        ],
      ),
    );
  }
}
