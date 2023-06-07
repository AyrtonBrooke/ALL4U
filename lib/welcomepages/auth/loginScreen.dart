import 'package:assignment/home/home.dart';
import 'package:assignment/welcomepages/auth/signUpScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import '../../main.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with SingleTickerProviderStateMixin {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();
  }

  final image1 = 'assets/images/logo.png';

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    _controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.brown[200],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedBuilder(
                  animation: _controller,
                  builder: (_, child) {
                    return Transform.rotate(
                      angle: _controller.value * 2 * math.pi,
                      child: child,
                  );
                },
                  child: Image.asset(image1,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                Text(
                  'Sign In',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                      color: Colors.brown[400]
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 20, right: 20, bottom: 20, top: 20),
                        child: TextFormField(
                          controller: emailController,
                          decoration: const InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                            prefixIcon: Icon(
                              Icons.person,
                              color: Colors.brown,
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            labelText: "Email",
                            hintText: 'your-email@domain.com',
                            labelStyle: TextStyle(color: Colors.brown),
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Form(
                          child: TextFormField(
                            obscuringCharacter: '*',
                            controller: passwordController,
                            obscureText: true,
                            decoration: const InputDecoration(
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                              prefixIcon: Icon(
                                Icons.lock,
                                color: Colors.brown,
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              labelText: "Password",
                              hintText: '*********',
                              labelStyle: TextStyle(color: Colors.brown),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        backgroundColor: Colors.brown,
                        padding: EdgeInsets.symmetric(
                            horizontal: screenWidth / 4,
                            vertical: screenHeight / 60)
                        ),
                    onPressed: () {
                      FirebaseAuth.instance
                          .signInWithEmailAndPassword(
                            email: emailController.text,
                            password: passwordController.text)
                          .then((value) {
                            print("Logged in");
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => MyHomePage(title: 'home')));
                          }).onError((error, stackTrace) {
                            print("Error ${error.toString()}");
                          });
                      },
                    child: const Text(
                      'Login',
                      style:  TextStyle(fontSize: 17),
                    )),
                const SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('not a member?'),
                    const SizedBox(width: 4),
                    TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpScreen()));
                      },
                      child: const Text('Register Now',
                        style: TextStyle(color: Colors.lightBlue, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}