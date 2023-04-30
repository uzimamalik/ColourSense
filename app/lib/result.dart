import 'package:flutter/material.dart';
import 'package:tinycolor2/tinycolor2.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({
    super.key, 
    required this.detected
    });
  final int detected;
  
  @override
  Widget build(BuildContext context) {
    Color detectedColor = Color(detected);
    TinyColor tinyColor = TinyColor.fromColor(detectedColor);
    
    TinyColor color1 = tinyColor.spin(60);
    color1 = color1.brighten(50);

    TinyColor color2 = tinyColor.spin(300);
    color2 = color2.darken(50);

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
          color: color1.color,
        ), Container(
          width: 100,
          height: 50,
          color: color2.color,
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
