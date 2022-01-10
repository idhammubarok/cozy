import 'package:flutter/material.dart';

class RatingItem extends StatelessWidget {
  final int? index;
  final int? rating;

  const RatingItem({Key? key, this.index, this.rating}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      index! <= rating!
          ? "assets/images/icon_star_solid.png"
          : "assets/images/icon_star_grey.png",
      width: 20,
    );
  }
}
