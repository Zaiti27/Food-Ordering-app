import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SmallButton extends StatelessWidget {
  final IconData icon;
  final double height;
  final double width;
  final Color color;
  final double size;
  final double circular;
  final Color iconColor;

  SmallButton(this.icon, this.height, this.width, this.color, this.size,
      this.circular, this.iconColor);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: this.height,
          width: this.width,
          decoration: BoxDecoration(
            color: this.color,
            borderRadius: BorderRadius.circular(this.circular),
          ),
          child: Icon(
            icon,
            size: this.size,
            color: this.iconColor,
          ),
        ),
      ),
    );
  }
}
