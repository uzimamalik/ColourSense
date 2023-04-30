import 'dart:async';
import 'dart:io';
import 'package:app/splash.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
// import 'package:app/splash.dart';

import 'camera.dart';
import 'result.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final cameras = await availableCameras();
  final cameraUsed = cameras.first;
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData.light(),
    home: Splash(camera: cameraUsed,)));

}
