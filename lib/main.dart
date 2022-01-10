import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:training/future_builder.dart';
import 'package:training/screens/settings/settings_screen.dart';
import 'package:training/screens/status_view_screen.dart';
import 'package:training/screens/product_detail_screen.dart';
import 'package:training/screens/whatsapp_login_screen.dart';
import 'package:training/screens/whatsapp_signup_screen.dart';
//import './homework1.dart';
//import './screens/home_screen.dart';

import './screens/registration_screen.dart';
import 'screens/signin_screen.dart';
import 'package:firebase_core/firebase_core.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

// initialiseFirebaseApp() async {
//   FirebaseApp app = await
//   assert(app != null);
//   print('Initialized default app $app');
// }

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const WhatsAppLoginScreen(),
      builder: EasyLoading.init(),
      routes: {
        SigninScreen.routeName: (ctx) => const SigninScreen(),
        //WhatsAppLoginScreen.routeName: (ctx) => const WhatsAppLoginScreen(),
        RegistrationScreen.routeName: (ctx) => const RegistrationScreen(),
        ProductDetailScreen.routeName: (ctx) => const ProductDetailScreen(),
        //HomeScreen.routeName: (ctx)=> HomeScreen(),
        WhatsAppSignupScreen.routeName: (ctx) => const WhatsAppSignupScreen(),
        StatusViewScreen.routeName: (ctx) => const StatusViewScreen(),
        SettingsScreen.routeName: (ctx) => const SettingsScreen(),
      },
    );
  }
}

class FirebaseExample extends StatelessWidget {
  const FirebaseExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            // DocumentSnapshot snapshot = await FirebaseFirestore.instance
            //     .collection('users')
            //     .doc('74vryNlNwzAex3io61cq')
            //     .get();

            // await FirebaseFirestore.instance
            //     .collection('users')
            //     .doc('Q3PvGWUCmjwJ90flFnfq').delete();

            // print(snapshot.data());

            // await FirebaseFirestore.instance
            //     .collection('users')
            //     .doc('BCSG2cNzPophdMvPNJ1X')
            //     .update({
            //   'child name': 'Harshita Singh',
            //   'date of marriage': '22nd Nov 2025',
            //   'name': 'Nisha Jha',
            //   'husband name': 'Sagar Singh',
            // });

            try {
              // UserCredential userCredential =
              //     await FirebaseAuth.instance.createUserWithEmailAndPassword(
              //  email: 'tjparaphase@gmail.com',
              //   password: 'TJparaphase1',
              // );

              // print('User credentials are ${userCredential.user!.uid}');

              // await FirebaseAuth.instance.signInWithEmailAndPassword(
              //   email: 'tjparaphase@gmail.com',
              //   password: 'TJpgaraphase1',
              // );

              await FirebaseAuth.instance
                  .sendPasswordResetEmail(email: 'tjparaphase@gmail.com');
            } catch (e) {
              //print('Type ${e.runtimeType} : Error is ${e.toString()}');
            }
          },
          child: const Text('Press me'),
        ),
      ),
    );
  }
}
