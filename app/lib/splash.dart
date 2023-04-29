import 'package:flutter/material.dart';
import 'package:app/main.dart';
import 'dart:io';

import 'main.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _navigatetohome();
  }

  _navigatetohome()async{
    await Future.delayed(const Duration(milliseconds: 2500), () {});
    if (!context.mounted) return;
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const MyHomePage(title: 'GFG', )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center (
      child: Container(
        //child: Image.file(File("assets/images/im.png")),
        child: Column(
          children: const [
            Text(
              'Your journey to fashion starts here!',
              style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold
              )
            ),          
          ],
        )
      )
      )
    );
  }
}