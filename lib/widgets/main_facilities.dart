import 'package:cozy/theme.dart';
import 'package:flutter/material.dart';

class MainFacilities extends StatelessWidget {
  final String? imageUrl;
  final int? count;
  final String? name;

  const MainFacilities({Key? key, this.imageUrl, this.count, this.name})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          imageUrl.toString(),
          width: 32,
        ),
        Text.rich(
          TextSpan(
            text: count.toString(),
            style: TextStyle(
              color: purpleColor,
            ),
            children: [
              TextSpan(
                text: name.toString(),
                style: TextStyle(
                  color: greyColor,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
