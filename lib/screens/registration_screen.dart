//import 'package:email_validator/email_validator.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

import 'signin_screen.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({ Key? key }) : super(key: key);
  static const routeName = '/registration';

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  void gotoSigninScreen(BuildContext context) {
    Navigator.of(context).pushReplacementNamed(
      SigninScreen.routeName,
      arguments: {
        'emailKey': emailKey,
        'passwordKey': passwordKey,
      },
    );
  }

  bool isPasswordVisible = true;

  final _registrationFormKey = GlobalKey<FormState>();
  bool emailKey = false;
  bool passwordKey = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register!'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Image.asset(
                  'assets/image/my_logo.png',
                  height: 170,
                  width: 170,
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(25),
                child: Form(
                  key: _registrationFormKey,
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(labelText: 'Enter Name'),
                        keyboardType: TextInputType.name,
                        validator: (name) {
                          if (name!.isEmpty) {
                            //print('Field cannot be empty');
                            return 'Field cannot be empty';
                          } else {
                            final String namefield = name;
                            if (namefield.length > 15) {
                              return 'Enter smaller Name';
                            }
                          }

                          //print(name);
                          return null;
                        },
                      ),
                      TextFormField(
                        decoration: const InputDecoration(labelText: 'Enter Email'),
                        keyboardType: TextInputType.emailAddress,
                        validator: (email) {
                          //print(email);
                          if (email!.isEmpty) {
                            //print('Field cannot be empty');
                            return 'Field cannot be empty';
                          } else {
                            if (!EmailValidator.validate(email)) {
                              return 'Enter a valid Email address!';
                            }
                          }

                          return null;
                        },
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Password',
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                isPasswordVisible = !isPasswordVisible;
                              });
                            },
                            icon: isPasswordVisible
                                ? const Icon(
                                    Icons.remove_red_eye,
                                  )
                                : const Icon(Icons.remove_red_eye_outlined),
                          ),
                        ),
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: isPasswordVisible,
                        validator: (password) {
                          //print(password);
                          if (password!.isEmpty) {
                            return '*required';
                          } else {
                            final String passwordField = password;
                            if (passwordField.length < 6 ||
                                passwordField.length > 10) {
                              return '* Password should be greater than 6 and less than 10 characters';
                            }
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  if (_registrationFormKey.currentState!.validate()) {
                    //print('${_registrationFormKey.currentState!.validate()}');
                    setState(() {
                      emailKey = !emailKey;
                      passwordKey = !passwordKey;
                    });

                    //print(emailKey);
                    //print(passwordKey);
                    gotoSigninScreen(context);
                  }
                  //print('${_registrationFormKey.currentState!.validate()}');
                },
                child: const Text('Register'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
