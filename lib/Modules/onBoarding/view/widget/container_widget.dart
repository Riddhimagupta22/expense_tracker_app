import 'package:flutter/material.dart';

class ContainerWidget extends StatelessWidget {
  Widget child;
  ContainerWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: tiltClipper(),
      child: Container(
        width: double.infinity,
        height: 260,
        decoration: const BoxDecoration(
          color: Color.fromRGBO(238, 248, 247, 1)
        ),
        child: child,
      ),
    );
  }
}

class tiltClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // TODO: implement getClip

    final path = Path();
    path.moveTo(0, 0);

    path.lineTo(size.width - 50,0);
    path.lineTo(size.width, size.height*.85);
    path.lineTo( 0,size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return false;
  }
}
