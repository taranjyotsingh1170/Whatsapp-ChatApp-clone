//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
//import 'package:training/screens/forgot_password_screen.dart';
import 'package:training/screens/home_screen.dart';
//import 'package:training/screens/home_screen.dart';
import 'package:training/screens/whatsapp_login_screen.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
//import 'package:training/widgets/user_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

//import 'package:firebase_core/firebase_core.dart';

class WhatsAppSignupScreen extends StatefulWidget {
  const WhatsAppSignupScreen({Key? key}) : super(key: key);
  static const routeName = '/-whatsapp-signup-screen';

  @override
  State<WhatsAppSignupScreen> createState() => _WhatsAppSignupScreenState();
}

class _WhatsAppSignupScreenState extends State<WhatsAppSignupScreen> {
  final _registrationKey = GlobalKey<FormState>();

  bool isPasswordVisible = true;
  final emailController = TextEditingController();
  final pwController = TextEditingController();
  final phoneController = TextEditingController();

  bool loading = false;

  late String userId;

  String? email;
  String? phone;

  Future<dynamic> accountCreation() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF075e54),
        title: const Text('SignUp'),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 150,
            ),
            Container(
              alignment: Alignment.center,
              child: const CircleAvatar(
                radius: 50,
                backgroundColor: Colors.white,
                backgroundImage: NetworkImage(
                  'https://upload.wikimedia.org/wikipedia/commons/thumb/6/6b/WhatsApp.svg/766px-WhatsApp.svg.png',
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: Form(
                key: _registrationKey,
                child: Column(
                  children: [
                    TextFormField(
                      decoration:
                          const InputDecoration(labelText: 'Enter email'),
                      keyboardType: TextInputType.emailAddress,
                      controller: emailController,
                      validator: (email) {
                        //print(email);
                        if (email!.isEmpty) {
                          return 'required';
                        }
                        if (!EmailValidator.validate(email)) {
                          return 'Invalid email address';
                        }
                      },
                    ),
                    TextFormField(
                      decoration:
                          const InputDecoration(labelText: 'Phone number'),
                      keyboardType: TextInputType.phone,
                      controller: phoneController,
                      validator: (phone) {
                        //print(phone);
                        if (phone!.isEmpty) {
                          return 'required';
                        }
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Enter Password',
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

                      //keyboardType: TextInputType.visiblePassword,
                      obscureText: isPasswordVisible,
                      controller: pwController,
                      validator: (password) {
                        //print(password);
                        if (password!.isEmpty) {
                          return '* required';
                        }
                        if (password.length < 6) {
                          return 'Password should be > or = 6 digits';
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              child: const Text('Create Account'),
              onPressed: () async {
                //print(_registrationKey.currentState!);
                bool validateAccount =
                    _registrationKey.currentState!.validate();

                if (validateAccount) {
                  //EasyLoading.show(status: 'Creating Account');
                  setState(() {
                    loading = true;
                    if (loading == true) {
                      EasyLoading.show(status: 'Creating Account');
                    }
                  });
                  try {
                    UserCredential _userCredential = await FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                      email: emailController.text,
                      password: pwController.text,
                    );
                    userId = _userCredential.user!.uid;
                    await FirebaseFirestore.instance
                        .collection('users')
                        .doc(userId)
                        .set({
                      'email': emailController.text,
                      'phone number': phoneController.text,
                    });

                    DocumentSnapshot snapshot = await FirebaseFirestore.instance
                        .collection('users')
                        .doc(_userCredential.user!.uid)
                        .get();

                    email = (snapshot.data() as Map<String, dynamic>)['email'];
                    phone = (snapshot.data()
                        as Map<String, dynamic>)['phone number'];

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

                    setState(() {
                      loading = false;
                    });
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'email-already-in-use') {
                      EasyLoading.showError('Email already exists');
                      setState(() {
                        validateAccount = !validateAccount;
                      });
                    }
                    // print('Error is ${e.code}');
                  }

                  if (validateAccount) {}
                } else {
                  EasyLoading.showError('Error');
                  loading = false;

                  // EasyLoadingIndicatorType.circle = const Padding(
                  //           padding: EdgeInsets.all(5.0),
                  //           child: Text('ring'));
                }
              },
              style: ElevatedButton.styleFrom(
                primary: const Color(0xFF075e54),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Already a User?',
                  style: TextStyle(fontSize: 15),
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
                  child: const Text(
                    'LogIn here',
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
