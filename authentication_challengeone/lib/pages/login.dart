import 'package:authentication_challengeone/pages/home.dart';
import 'package:authentication_challengeone/pages/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';


import '../widgets/firstwidget.dart';

class signin extends StatefulWidget {
  const signin({super.key});

  @override
  State<signin> createState() => _signinState();
}

TextEditingController _passwordTextController = TextEditingController();
TextEditingController _emailTextController = TextEditingController();

class _signinState extends State<signin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(color: Colors.pink),
        child: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(children: <Widget>[
            logowidget("assets/salon.jpg"),
            SizedBox(
              height: 30,
            ),
            textfield1("Enter Username ", Icons.person_outline, false,
                _emailTextController),
            SizedBox(
              height: 30,
            ),
            textfield1("Enter password ", Icons.lock_outline, true,
                _passwordTextController),
            SizedBox(
              height: 30,
            ),
            signinbutton(context, true, () {
              FirebaseAuth.instance
                  .signInWithEmailAndPassword(
                      email: _emailTextController.text,
                      password: _passwordTextController.text)
                  .then((value) {
                Navigator.push(context,
                        MaterialPageRoute(builder: ((context) => HomeScreen())))
                    .onError((error, stackTrace) {
                  print("error ocurred ${error.toString()}");
                });
              });
            }),
            signup()
          ]),
        )),
      ),
    );
  }

  Row signup() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("New to the App? "),
        GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => signupScreen())));
            },
            child: const Text(
              "Sign up!",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ))
      ],
    );
  }
}
