import 'package:flutter/material.dart';
import 'package:multiple_role/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String email = '';

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    // ignore: unused_local_variable
    SharedPreferences sp = await SharedPreferences.getInstance();
    email = sp.getString('email') ?? '';
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          const Center(child: Text('Home Screen')),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [const Text('Email:'), Text(email.toString())],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 200),
            child: InkWell(
              onTap: () async {
                SharedPreferences sp = await SharedPreferences.getInstance();
                sp.clear();
                // ignore: use_build_context_synchronously
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen()));
              },
              child: Container(
                height: 50,
                width: double.infinity,
                color: Colors.blue,
                child: const Center(child: Text('Log out')),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
