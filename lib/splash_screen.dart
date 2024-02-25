import 'package:flutter/material.dart';
import 'package:quiz_app_new/Home_Screen.dart';

class splashScreen extends StatefulWidget {
  const splashScreen({super.key});

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return HomeScreen();
          },
        ),
      );
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           Container(
            width: 350,
            child: Image.asset('assets/pngwing.com (2).png')),
          ],
        ),
      ),
    );
  }
}
