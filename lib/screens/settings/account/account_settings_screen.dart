import 'package:flutter/material.dart';
import 'package:training/screens/settings/account/change_number.dart';
import 'package:training/screens/settings/account/delete_my_account.dart';
import 'package:training/screens/settings/account/privacy/privacy.dart';
import 'package:training/screens/settings/account/request_account_info.dart';
import 'package:training/screens/settings/account/security.dart';
import 'package:training/screens/settings/account/two_step_verification.dart';

class AccountSettingsScreen extends StatelessWidget {
  const AccountSettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account'),
        backgroundColor: const Color(0xFF075e54),
      ),
      body: Column(
        children: [
          ListTile(
            leading: const Icon(Icons.lock),
            title: const Text('Privacy'),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const Privacy()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.security),
            title: const Text('Security'),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const Security()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.domain_verification),
            title: const Text('Two-step verification'),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const TwoStepVerification()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.phonelink_ring_outlined),
            title: const Text('Change number'),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const ChangeNumber()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.request_quote),
            title: const Text('Request account info'),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const RequestAccountInfo()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.delete),
            title: const Text('Delete my account'),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const DeleteMyAccount()),
              );
            },
          ),
        ],
      ),
    );
  }
}
