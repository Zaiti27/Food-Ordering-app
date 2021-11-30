import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Stars extends StatelessWidget {
  final Color coleur1;
  final Color coleur2;
  final Color coleur3;
  final Color coleur4;
  final Color coleur5;
  Stars(this.coleur1, this.coleur2, this.coleur3, this.coleur4, this.coleur5);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.star,
          size: 15,
          color: this.coleur1,
        ),
        Icon(
          Icons.star,
          size: 15,
          color: this.coleur2,
        ),
        Icon(
          Icons.star,
          size: 15,
          color: this.coleur3,
        ),
        Icon(
          Icons.star,
          size: 15,
          color: this.coleur4,
        ),
        Icon(
          Icons.star,
          size: 15,
          color: this.coleur5,
        ),
      ],
    );
  }
}
