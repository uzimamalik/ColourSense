import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'camera.dart';

class Splash extends StatefulWidget {
  const Splash({
    super.key,
    required this.camera,
    });
  final CameraDescription camera;
    
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
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>  CameraPage(camera: widget.camera)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center (
          child: Image.asset('assets/images/Splash_screen.jpg', width: 350, height: 350)
      ),
    );
  }
}