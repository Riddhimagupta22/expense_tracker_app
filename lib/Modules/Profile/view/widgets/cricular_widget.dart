import 'package:flutter/material.dart';

class CircularImage extends StatelessWidget {
  final BoxFit? fit;
  final String image;
  final bool isNetworkimage;
  final Color? overlayColor;
  final Color? backgroundColor;
  final double height, width;

  const CircularImage({
    super.key,
    this.fit = BoxFit.cover,
    required this.image,
    this.isNetworkimage = false,
    this.overlayColor,
    this.backgroundColor = const Color.fromRGBO(136, 136, 136, 1),
    this.height = 156,
    this.width = 156,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: BoxShape.circle,
      ),
      child: ClipOval(
        child: Image(
          width: width,
          height: height,
          fit: fit,
          image: isNetworkimage
              ? NetworkImage(image)
              : AssetImage(image) as ImageProvider,
          color: overlayColor,
          colorBlendMode: overlayColor != null ? BlendMode.srcATop : null,
        ),
      ),
    );
  }
}
