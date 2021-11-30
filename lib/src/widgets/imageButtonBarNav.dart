import 'package:flutter/material.dart';
import 'package:imagebutton/imagebutton.dart';

class ImageButtonNav extends StatelessWidget {
  final String image;
  final double height;
  final double width;
  ImageButtonNav(this.image, this.height, this.width);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ImageButton(
        children: <Widget>[],
        height: this.height,
        width: this.width,
        pressedImage: Image.asset(
          "images/$image",
        ),
        unpressedImage: Image.asset(
          "images/$image",
          color: Colors.red[400],
        ),
        onTap: () {
          print('Home');
        },
      ),
    );
  }
}
