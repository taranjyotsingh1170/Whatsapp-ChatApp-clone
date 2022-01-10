import 'package:flutter/material.dart';

class StorageDataSettingsSCreen extends StatelessWidget {
  const StorageDataSettingsSCreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Storage and data'),
        elevation: 0,
        backgroundColor: const Color(0xFF075e54),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Column(
              children: [
                const ListTile(
                  leading: Icon(Icons.folder),
                  title: Text('Manage storage'),
                  subtitle: Text('5.7 GB'),
                ),
                const ListTile(
                  leading: Icon(Icons.circle_outlined),
                  title: Text('Network usage'),
                  subtitle: Text('7.7 GB sent 12.9 GB received'),
                ),
                SwitchListTile(
                  contentPadding: const EdgeInsets.only(left: 70),
                  value: false,
                  onChanged: (bool value) {},
                  title: const Text('Use less data for calls'),
                ),
              ],
            ),
          ),
          const Divider(),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Media auto-download',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text('Voice messages are always automatically download'),
                    ],
                  ),
                  
                ),
                
                const ListTile(
                  contentPadding: EdgeInsets.only(left: 70),
                  title: Text('When using mobile data'),
                  subtitle: Text('No media'),
                ),
                const ListTile(
                  contentPadding: EdgeInsets.only(left: 70),
                  title: Text('When connected on Wi-Fi'),
                  subtitle: Text('No media'),
                ),
                const ListTile(
                  contentPadding: EdgeInsets.only(left: 70),
                  title: Text('When roaming'),
                  subtitle: Text('No media'),
                ),
              ],
            ),
          ),
          const Divider(),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Media upload quality',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text('Choose the quality of media files to be sent'),
                    ],
                  ),
                ),
                const ListTile(
                  contentPadding: EdgeInsets.only(left: 70),
                  title: Text('Photo upload quality'),
                  subtitle: Text('Auto (recommended)'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
