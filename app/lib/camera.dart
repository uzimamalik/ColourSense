import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

// allows the user to take pictures
class CameraPage extends StatefulWidget {
  const CameraPage({
    super.key,
    required this.camera,
  });
  final CameraDescription camera;

  @override
  CameraPageState createState() => CameraPageState();
}

class CameraPageState extends State<CameraPage> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 1), () {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Instructions'),
            content: const Text('Please capture an image of the clothing item you desire to pair, and we will provide the corresponding colors that complement it.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Ok!'),
              ),
            ],
          );
        },
      );
    }
    );
    _controller = CameraController(
      widget.camera,
      ResolutionPreset.medium,
    );

    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Camera')),
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return CameraPreview(_controller);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          try {
            await _initializeControllerFuture;
            final image = await _controller.takePicture();

            if (!mounted) return;

            await Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => DisplayPictureScreen(
                  imagePath: image.path,
                ),
              ),
            );
          } catch (e) {
            // If an error occurs, log the error to the console.
            print(e);
          }
        },
        child: const Icon(Icons.camera_alt),
      ),
    );
  }
}

// A widget that displays the picture taken by the user.
class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;

  const DisplayPictureScreen({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Picture Taken')),
      body: Column(
      children: <Widget>[
        Expanded(
          child: FittedBox(
          fit: BoxFit.fitWidth,
          child: Image.file(File(imagePath)),
          ),
        ),
        Row(
          children:<Widget>[
            TextButton(
              onPressed: () {
              Navigator.pop(context);
            },  
            child: const Text("Retake")),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
            }, 
            child: const Text("Done")),
        ])
      ],
    ),
    );
  } 
}