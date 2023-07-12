import 'dart:async';

import 'package:flutter/material.dart';
import 'package:multiple_role/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: unused_import
import 'home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // ignore: prefer_const_constructors
    // means k bar bar login krne ki zarorat nhi hai hamein
    islogin();
  }

  void islogin() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    // ignore: unused_local_variable
    bool islogin = sp.getBool('islogin') ?? false;
    if (islogin) {
      Timer(const Duration(seconds: 3), () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const Home()));
      });
    } else {
      Timer(const Duration(seconds: 3), () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const LoginScreen()));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
      child: Text('Lets Started'),
    ));
  }
}
