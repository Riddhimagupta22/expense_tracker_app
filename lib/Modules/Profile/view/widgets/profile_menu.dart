import 'package:flutter/material.dart';

class GProfileMenu extends StatelessWidget {
  final String title;
  final void Function()? onPressed;
  final Color? bgcolor;
  final Color? iconcolor;
  final IconData icon;

  const GProfileMenu({
    super.key,
    required this.title,
    this.onPressed,
    required this.icon,
    this.bgcolor,
    this.iconcolor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            CircleAvatar(
              radius: 15,
              backgroundColor: bgcolor ?? Colors.grey.shade300,
              child: Icon(
                icon,
                size: 17,
                color: iconcolor ?? Colors.black,
              ),
            ),
            const SizedBox(width: 25),
            Expanded(
              flex: 6,
              child: Text(
                title,
                style: Theme.of(context).textTheme.bodyMedium,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const Icon(Icons.keyboard_arrow_right_rounded, size: 29),
          ],
        ),
      ),
    );
  }
}
