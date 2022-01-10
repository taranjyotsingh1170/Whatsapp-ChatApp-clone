import 'package:flutter/material.dart';
import 'status_view_screen.dart';

class StatusListScreen extends StatelessWidget {
  const StatusListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My status'),
      ),
      body: SizedBox(
        child: ListView(
          children: [
            ListTile(
              leading: const CircleAvatar(
                radius: 25,
                backgroundImage: NetworkImage(
                    'https://c.stocksy.com/a/27d300/z9/865336.jpg'),
              ),
              title: const Text(
                '89 views',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: const Text('Yesterday, 9:22 pm'),
              trailing: PopupMenuButton(
                itemBuilder: (_) => [
                  const PopupMenuItem(
                    child: Text('Forward'),
                  ),
                  const PopupMenuItem(
                    child: Text('Share...'),
                  ),
                  const PopupMenuItem(
                    child: Text('Share to Facebook'),
                  ),
                  const PopupMenuItem(
                    child: Text('Delete'),
                  ),
                ],
              ),
              onTap: () =>
                  Navigator.of(context).pushNamed(StatusViewScreen.routeName),
            ),
          ],
        ),
      ),
    );
  }
}
