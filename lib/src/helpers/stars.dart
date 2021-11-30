import 'package:flutter/material.dart';
import 'package:flutter_application_1/src/widgets/rating.dart';

Stars stars(int rates) {
  if (rates == 1)
    return Stars(Colors.red, Colors.grey[400], Colors.grey[400],
        Colors.grey[400], Colors.grey[400]);
  else if (rates == 2) {
    return Stars(Colors.red, Colors.red, Colors.grey[400], Colors.grey[400],
        Colors.grey[400]);
  } else if (rates == 3) {
    return Stars(
        Colors.red, Colors.red, Colors.red, Colors.grey[400], Colors.grey[400]);
  } else if (rates == 4) {
    return Stars(
        Colors.red, Colors.red, Colors.red, Colors.red, Colors.grey[400]);
  } else {
    return Stars(
      Colors.red,
      Colors.red,
      Colors.red,
      Colors.red,
      Colors.red,
    );
  }
}
