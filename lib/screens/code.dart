import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:training/screens/forgot_password_screen.dart';
import 'package:training/screens/home_screen.dart';
import 'package:training/screens/whatsapp_signup_screen.dart';

class WhatsAppLoginScreen extends StatefulWidget {
  const WhatsAppLoginScreen({Key? key}) : super(key: key);

  static const routeName = '/whatsapp-login-screen';

  @override
  State<WhatsAppLoginScreen> createState() => _WhatsAppLoginScreenState();
}

class _WhatsAppLoginScreenState extends State<WhatsAppLoginScreen> {
  final loginKey = GlobalKey<FormState>();

  bool isPasswordVisible = true;
  final loginEmail = TextEditingController();
  final loginPassword = TextEditingController();
  bool loading = false;

  late String userId;
  String? email;

  String? phone;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('WhatsApp'),
        backgroundColor: const Color(0xFF075e54),
        elevation: 0,
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(15),
          child: Form(
            key: loginKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Email address'),
                  keyboardType: TextInputType.emailAddress,
                  controller: loginEmail,
                  validator: (email) {
                    if (email!.isEmpty) {
                      return '* required';
                    }
                  },
                ),
                TextFormField(
                  controller: loginPassword,
                  decoration: InputDecoration(
                    labelText: 'Enter password',
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isPasswordVisible = !isPasswordVisible;
                        });
                      },
                      icon: isPasswordVisible
                          ? const Icon(Icons.remove_red_eye)
                          : const Icon(Icons.remove_red_eye_outlined),
                    ),
                  ),
                  obscureText: isPasswordVisible,
                  keyboardType: TextInputType.visiblePassword,
                  validator: (password) {
                    if (password!.isEmpty) {
                      return '* required';
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (loginKey.currentState!.validate()) {
                      setState(() {
                        loading = true;
                        if (loading == true) {
                          EasyLoading.show(status: 'Logging in');
                        }
                      });

                      AuthCredential credential = EmailAuthProvider.credential(
                        email: loginEmail.text,
                        password: loginPassword.text,
                      );

                      try {
                        UserCredential userCredential = await FirebaseAuth
                            .instance
                            .signInWithCredential(credential);

                        userId = userCredential.user!.uid;
                        DocumentSnapshot snapshot = await FirebaseFirestore
                            .instance
                            .collection('users')
                            .doc(userId)
                            .get();

                        email =
                            (snapshot.data() as Map<String, dynamic>)['email'];
                        phone = (snapshot.data()
                            as Map<String, dynamic>)['phone number'];
                        setState(() {
                          loading = false;
                        });

                        EasyLoading.dismiss();
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (_) {
                              return HomeScreen(
                                email: email,
                                phone: phone,
                                userId: userId,
                              );
                            },
                          ),
                        );
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'wrong-password') {
                          EasyLoading.showError('Incorrect password');
                        }
                        if (e.code == 'user-not-found') {
                          EasyLoading.showError('User not found');
                        }
                        if (e.code == 'invalid-email') {
                          EasyLoading.showError('Invalid email');
                        }
                      }
                    }
                  },
                  child: const Text(
                    'Login',
                    style: TextStyle(fontSize: 18),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: const Color(0xFF075e54),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'New User?',
                      style: TextStyle(fontSize: 15),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (_) {
                              return const WhatsAppSignupScreen();
                            },
                          ),
                        );
                      },
                      child: const Text(
                        'SignUp',
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ],
                ),
                TextButton(
                  onPressed: () async {
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (_) {
                        return ForgotPassword();
                      }),
                    );
                  },
                  child: const Text('Forgot Password?'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
