import 'package:flutter/material.dart';

class CircularImage extends StatelessWidget {
  final BoxFit? fit;
  final String image;
  final bool isNetworkimage;
  final Color? overlayColor;
  final Color? backgroundColor;
  final double height, width;

  const CircularImage(
      {super.key,
        this.fit = BoxFit.contain,
        required this.image,
        this.isNetworkimage = false,
        this.overlayColor,
        this.backgroundColor,
        this.height = 156,
        this.width = 156,
        });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          color: Color.fromRGBO(136, 136, 136, 1),
          borderRadius: BorderRadius.circular(100)),
      child: Center(
        child: Image(
          fit: fit,
          image: isNetworkimage
              ? NetworkImage(image)
              : AssetImage(image) as ImageProvider,
          color: overlayColor,
        ),
      ),
    );
  }
}
