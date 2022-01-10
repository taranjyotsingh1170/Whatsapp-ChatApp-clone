import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:training/screens/whatsapp_login_screen.dart';

class ForgotPassword extends StatelessWidget {
  ForgotPassword({Key? key}) : super(key: key);

  final recoveryEmail = TextEditingController();

  final recoverPasswordKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Get your Password'),
        elevation: 0,
        backgroundColor: const Color(0xFF075e54),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 80,
          ),
          const Text(
            'Forgot Pasword?',
            style: TextStyle(fontSize: 25),
          ),
          const SizedBox(
            height: 15,
          ),
          const Text(
            'Don\'t worry! We\'ve got your back.',
            style: TextStyle(fontSize: 18),
          ),
          
          const SizedBox(
            height: 30,
          ),
          Container(
            margin: const EdgeInsets.all(15),
            child: Form(
              key: recoverPasswordKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: recoveryEmail,
                    decoration:
                        const InputDecoration(hintText: 'Enter email address'),
                    validator: (email) {
                      if (email!.isEmpty) {
                        return '* required';
                      }
                      if (!EmailValidator.validate(email)) {
                        return 'Enter valid email address';
                      }
                    },
                  ),
                  const SizedBox(height: 5),
                  const SizedBox(
                    width: double.infinity,
                    child: Text(
                      '* Enter registered email address',
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              if (recoverPasswordKey.currentState!.validate()) {
                try {
                  //FirebaseAuth.instance.confirmPasswordReset(code: code, newPassword: newPassword)
                  await FirebaseAuth.instance
                      .sendPasswordResetEmail(email: recoveryEmail.text);

                  EasyLoading.showSuccess('Reset link sent to above email');
                } on FirebaseAuthException catch (e) {
                  if (e.code == 'user-not-found') {
                    EasyLoading.showError('Unregistered user!');
                  }
                  //print('Error is ${e.code}');
                }
                //EasyLoading.dismiss();

              }
            },
            child: const Text('Submit'),
            style: ElevatedButton.styleFrom(
              primary: const Color(0xFF075e54),
            ),
          ),
          TextButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (_) {
                      return const WhatsAppLoginScreen();
                    },
                  ),
                );
              },
              child: const Text('Login here')),
        ],
      ),
    );
  }
}
