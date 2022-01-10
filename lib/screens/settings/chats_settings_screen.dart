import 'package:flutter/material.dart';

class ChatSettingsScreen extends StatelessWidget {
  const ChatSettingsScreen({Key? key}) : super(key: key);

  Widget alertBox(BuildContext context, String title, String option1,
      String option2, String option3) {
    return AlertDialog(
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              const Icon(Icons.circle_outlined),
              const SizedBox(
                width: 10,
              ),
              Text(option1),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              const Icon(Icons.circle_outlined),
              const SizedBox(
                width: 10,
              ),
              Text(option2),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            children: [
              const Icon(Icons.circle_outlined),
              const SizedBox(
                width: 10,
              ),
              Text(option3),
            ],
          ),
          SizedBox(
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('CANCEL'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('OK'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget fontSizeBox(String title) {
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
              Text('Small'),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            children: const [
              Icon(Icons.circle_outlined),
              SizedBox(
                width: 10,
              ),
              Text('Medium'),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            children: const [
              Icon(Icons.circle_outlined),
              SizedBox(
                width: 10,
              ),
              Text('Large'),
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
        title: const Text('Chats'),
        elevation: 0,
        backgroundColor: const Color(0xFF075e54),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 20),
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Text('Display'),
                ),
                ListTile(
                    leading: const Icon(Icons.light_mode_rounded),
                    title: const Text('Theme'),
                    subtitle: const Text('Light'),
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (_) {
                          return alertBox(context, 'Choose theme',
                              'System default', 'Light', 'Dark');
                        },
                      );
                    }),
                const ListTile(
                  leading: Icon(Icons.wallpaper),
                  title: Text('Wallpaper'),
                ),
              ],
            ),
          ),
          const Divider(),
          SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Text('Chat settings'),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 45),
                  child: Column(
                    children: [
                      SwitchListTile(
                        title: const Text('Enter is send'),
                        subtitle:
                            const Text('Enter key will send your message'),
                        value: false,
                        onChanged: (bool value) {},
                      ),
                      SwitchListTile(
                        title: const Text('Media visibility'),
                        subtitle: const Text(
                            'Show newly downloaded media in your phone\'s gallery'),
                        value: false,
                        onChanged: (bool value) {},
                      ),
                      ListTile(
                        title: const Text('Font size'),
                        subtitle: const Text('Medium'),
                        onTap: () {
                      showDialog(
                        context: context,
                        builder: (_) {
                          return fontSizeBox('Font size');
                        },
                      );
                    }
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Divider(),
          Container(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              children: const [
                ListTile(
                  leading: Icon(Icons.network_cell_outlined),
                  title: Text('App Language'),
                  subtitle: Text('Phone\'s language (English)'),
                ),
                ListTile(
                  leading: Icon(Icons.backup),
                  title: Text('Chat backup'),
                ),
                ListTile(
                  leading: Icon(Icons.history),
                  title: Text('Chat history'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
