//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../screens/calls_screen.dart';
import '../screens/camera_screen.dart';
import '../screens/settings/settings_screen.dart';
import '../screens/status_screen.dart';
import '../screens/chats_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen(
      {Key? key,
      required this.email,
      required this.phone,
      required this.userId})
      : super(key: key);

  static const routeName = '/homescreen';
  final String userId;
  //final DocumentSnapshot snapshot;
  final String? email;

  final String? phone;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      initialIndex: 1,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('WhatsApp'),
          backgroundColor: const Color(0xFF075e54),
          actions: [
            InkWell(
              splashColor: Colors.white.withOpacity(0.7),
              radius: 12,
              child: const FlutterLogo(
                size: 20,
              ),
              onTap: () async {
                var url = 'https://flutter.dev/';

                await launch(url);
              },
            ),
            const SizedBox(width: 10),
            const Icon(Icons.search),
            PopupMenuButton(
              offset: const Offset(1, 45),
              itemBuilder: (_) => [
                const PopupMenuItem(
                  child: Text('New group'),
                  value: 1,
                ),
                const PopupMenuItem(
                  child: Text('New broadcast'),
                  value: 2,
                ),
                const PopupMenuItem(
                  child: Text('Linked devices'),
                  value: 3,
                ),
                const PopupMenuItem(
                  child: Text('Starred messages'),
                  value: 4,
                ),
                const PopupMenuItem(
                  child: Text('Payments'),
                  value: 5,
                ),
                const PopupMenuItem(
                  child: Text('Settings'),
                  value: 6,
                ),
              ],
              onSelected: (value) {
                //print('Value is $value');
                if (value == 6) {
                  Navigator.of(context).pushNamed(SettingsScreen.routeName);
                }
              },
            ),
          ],
          bottom: const TabBar(
            tabs: [
              Tab(
                child: Icon(Icons.camera_alt_rounded),
              ),
              Tab(
                child: Text('CHATS'),
              ),
              Tab(
                child: Text('STATUS'),
              ),
              Tab(
                child: Text('CALLS'),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            const CameraScreen(),
            ChatsScreen(
              email: email,
              phone: phone,
              userId: userId,
            ),
            const StatusScreen(),
            const CallsScreen(),
          ],
        ),
      ),
    );
  }
}
