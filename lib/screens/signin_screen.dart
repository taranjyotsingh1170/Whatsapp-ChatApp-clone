import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import '../screens/home_screen.dart';
import '../screens/registration_screen.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({ Key? key }) : super(key: key);
  static const routeName = '/signinscreen';

  @override
  _SigninScreenState createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final signinKey = GlobalKey<FormState>();
  bool isPasswordVisible = true;

  @override
  Widget build(BuildContext context) {
    //final variable =
    //    ModalRoute.of(context).settings.arguments as Map<bool, bool>;
    //final emailK = variable['emailKey'];
    //final passwordK = variable['passwordKey'];
    return Scaffold(
      appBar: AppBar(
        title: const Text('SignIn'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(10.0),
            child: Form(
              key: signinKey,
              child: Column(
                children: [
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

                      return '';
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
                      return '';
                    },
                  ),
                ],
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (!signinKey.currentState!.validate()) {
                //print('${signinKey.currentState.validate()}');

                Navigator.of(context).pushNamed(HomeScreen.routeName);
              }
              //print('${signinKey.currentState!.validate()}');
            },
            child: const Text('SignIn'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Do not have account?',
                textAlign: TextAlign.center,
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushReplacementNamed(RegistrationScreen.routeName);
                },
                child: const Text('Signup'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
