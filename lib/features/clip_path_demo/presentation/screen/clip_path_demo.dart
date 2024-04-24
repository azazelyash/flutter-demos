import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ClipPathDemo extends StatelessWidget {
  const ClipPathDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text('Clip Path Demo'),
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            color: Colors.transparent,
            height: 200,
            width: 300,
            child: Stack(
              children: [
                ClipPath(
                  clipper: MyCustomCliper(),
                  child: Container(
                    color: Colors.teal,
                    height: 200,
                    width: 300,
                    padding: const EdgeInsets.all(12),
                    child: const Text(
                      "This is a custom clipper path demo. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
                const Positioned(
                  bottom: 0,
                  right: 0,
                  child: SizedBox(
                    height: 40,
                    width: 150,
                    child: Center(
                      child: Text("Clip Path"),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MyCustomCliper extends CustomClipper<Path> {
  double radius = 20;

  @override
  Path getClip(Size size) {
    Path path = Path()
      ..moveTo(0, radius)
      ..lineTo(0, size.height - radius)
      ..quadraticBezierTo(0, size.height, radius, size.height)
      ..lineTo(0.5 * size.width - radius / 2, size.height)
      ..quadraticBezierTo(0.5 * size.width, size.height, 0.5 * size.width, size.height - (radius / 2))
      ..lineTo(0.5 * size.width, size.height - 1.5 * radius)
      ..quadraticBezierTo(0.5 * size.width, size.height - (2 * radius), 0.5 * size.width + (radius / 2), size.height - (2 * radius))
      ..lineTo(size.width - radius, size.height - (2 * radius))
      ..quadraticBezierTo(size.width, size.height - (2 * radius), size.width, size.height - (3 * radius))
      ..lineTo(size.width, radius)
      ..quadraticBezierTo(size.width, 0, size.width - radius, 0)
      ..lineTo(radius, 0)
      ..quadraticBezierTo(0, 0, 0, radius)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
