import 'package:cozy/pages/home_page.dart';
import 'package:cozy/theme.dart';
import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
            child: Column(
          children: [
            const SizedBox(
              height: 214,
            ),
            Image.asset(
              "assets/images/error_404.png",
              width: 300,
              height: 85.95,
            ),
            const SizedBox(
              height: 70,
            ),
            const Text(
              "Where are you going?",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 14,
            ),
            Text(
              "Seems like the page that you were \nrequested is already gone",
              style: TextStyle(
                fontSize: 16,
                color: greyColor,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomePage(),
                    ),
                    (route) => false);
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(purpleColor),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(17),
                  ),
                ),
              ),
              child: Container(
                padding: const EdgeInsets.only(
                  left: 42,
                  right: 42,
                  top: 12,
                  bottom: 12,
                ),
                child: const Text(
                  "Back to Home",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
