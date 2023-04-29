import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:app/splash.dart';

import 'camera.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final cameras = await availableCameras();
  final cameraUsed = cameras.first;
  runApp(MaterialApp(
    theme: ThemeData.dark(),
    home: Splash(camera: cameraUsed)));
}
