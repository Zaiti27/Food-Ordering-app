import 'package:flutter/material.dart';

class BottomNavIcons extends StatelessWidget {
  final String image;
  final double height;
  final double width;
  final Function function;

  BottomNavIcons(
    this.image,
    this.height,
    this.width,
    this.function,
  );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.function ?? null,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset(
          "images/$image",
          height: this.height,
          width: this.width,
          color: Colors.red[600],
        ),
      ),
    );
  }
}
