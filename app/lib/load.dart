import 'package:flutter/material.dart';
import 'result.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class Load extends StatefulWidget {
  const Load({
    super.key,
  });

  @override
  State<Load> createState() => _LoadState();
}

class _LoadState extends State<Load> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(const Duration(milliseconds: 2500), () {});
    if (!context.mounted) return;
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => const ResultPage(detected: 0xFFD65DB1,)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/hanger.png',
              width: 275,
              height: 275,
            ),
            SizedBox(height: 20),
            LoadingAnimationWidget.staggeredDotsWave(
              color: Colors.pink,
              size: 200,
            ),
          ],
        ),
      ),
    );
  }
}
