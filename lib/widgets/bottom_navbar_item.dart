import 'package:cozy/theme.dart';
import 'package:flutter/material.dart';

class BottomNavbarItem extends StatelessWidget {
  final String? imageUrl;
  bool? isActive;

  BottomNavbarItem({
    Key? key,
    this.imageUrl,
    this.isActive = false,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(
          height: 2,
        ),
        Image.asset(
          imageUrl.toString(),
          width: 26,
        ),
        isActive!
            ? Container(
                width: 30,
                height: 2,
                decoration: BoxDecoration(
                  color: purpleColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(1000),
                    topRight: Radius.circular(1000),
                  ),
                ),
              )
            : Container(),
      ],
    );
  }
}
