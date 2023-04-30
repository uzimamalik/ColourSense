import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'camera.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({
    super.key, 
    required this.detected
    });
  final int detected;
  
  @override
  Widget build(BuildContext context) {
    Color detectedColor = Color(detected);
    return Stack(
      children: [
        const Positioned(top:50, left:50, child: Text('Detected colour:', style: TextStyle(fontSize: 20))),
        Positioned(top:100, left:50, child: Container(
          width: 100,
          height: 50,
          color: detectedColor,
        )),
        const Positioned(top:200, left:50, child:Text('Colours that would match:', style: TextStyle(fontSize: 20),)),
        Positioned(top:250, left:50, child:Row(children: [Container(
          width: 100,
          height: 50,
          color: getComplementaryColor(detectedColor),
        ), Container(
          width: 100,
          height: 50,
          color: getComplementaryColor(detectedColor),
        )])),
        Positioned(bottom: 50, right: 50,
        child: TextButton(
          onPressed: () {
            Navigator.of(context).popUntil((route) => route.isFirst);
          },
        child: const Text("Done"), 
        ))
      ]);
  }

}

Color getComplementaryColor(Color color) {
  // Convert the color to the HSL color space
  final hslColor = HSLColor.fromColor(color);
  // Calculate the complementary hue value (180 degrees away)
  final hue = (hslColor.hue + 180.0) % 360.0;
  // Create a new HSL color with the complementary hue and the same saturation and lightness
  final complementaryHSLColor = HSLColor.fromAHSL(
    hslColor.alpha,
    hue,
    hslColor.saturation,
    hslColor.lightness,
  );
  // Convert the HSL color back to a Flutter color object
  return complementaryHSLColor.toColor();
}