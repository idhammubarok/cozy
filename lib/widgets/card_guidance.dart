import 'package:cozy/models/guidence.dart';
import 'package:cozy/pages/error_page.dart';
import 'package:cozy/theme.dart';
import 'package:flutter/material.dart';

class CardGuidance extends StatelessWidget {
  Guidance? guidance;
  CardGuidance(this.guidance);
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset(
            "${guidance!.image}",
            width: 80,
          ),
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${guidance!.name}",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              "${guidance!.date}",
              style: TextStyle(
                color: greyColor,
              ),
            ),
          ],
        ),
        const Spacer(),
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ErrorPage(),
              ),
            );
          },
          child: IconButton(
            onPressed: null,
            icon: Icon(
              Icons.chevron_right,
              color: greyColor,
            ),
          ),
        ),
      ],
    );
  }
}
