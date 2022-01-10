import 'package:cozy/models/space.dart';
import 'package:cozy/pages/error_page.dart';
import 'package:cozy/theme.dart';
import 'package:cozy/widgets/main_facilities.dart';
import 'package:cozy/widgets/rating_item.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatelessWidget {
  final Space? space;
  DetailPage(this.space);

  @override
  Widget build(BuildContext context) {
    void launcerUrl(url) async {
      if (await canLaunch(url)) {
        launch(url);
      } else {
        // throw (url);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ErrorPage(),
          ),
        );
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Image.network(
              space!.imageUrl.toString(),
              width: MediaQuery.of(context).size.width,
              height: 350,
              fit: BoxFit.cover,
            ),
            ListView(
              children: [
                const SizedBox(height: 328),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 30),
                      Padding(
                        padding: const EdgeInsets.only(left: 24, right: 24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${space!.name}",
                                  style: const TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text.rich(
                                  TextSpan(
                                    text: "\$${space!.price}",
                                    style: TextStyle(
                                      color: purpleColor,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: " / month",
                                        style: TextStyle(
                                          color: blackColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: [1, 2, 3, 4, 5].map((index) {
                                return Container(
                                  margin: const EdgeInsets.only(left: 2),
                                  child: RatingItem(
                                    index: index,
                                    rating: space!.rating,
                                  ),
                                );
                              }).toList(),
                              // [
                              //   RatingItem(
                              //     index: 1,
                              //     rating: space!.rating,
                              //   ),
                              // ],
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 30),
                      const Padding(
                        padding: EdgeInsets.only(left: 24, right: 24),
                        child: Text(
                          "Main Faicilites",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      // NOTE : Main Facilities
                      Padding(
                        padding: const EdgeInsets.only(left: 24, right: 24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            MainFacilities(
                              imageUrl: "assets/images/icon3.png",
                              count: space!.numberOfKitchens,
                              name: " Kitchen",
                            ),
                            MainFacilities(
                              imageUrl: "assets/images/icon4.png",
                              count: space!.numberOfBedrooms,
                              name: " Bedroom",
                            ),
                            MainFacilities(
                              imageUrl: "assets/images/icon5.png",
                              count: space!.numberOfCupboards,
                              name: " Big Lemari",
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      // NOTE : POTOS
                      const Padding(
                        padding: EdgeInsets.only(left: 24, right: 24),
                        child: Text(
                          "Photos",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          // left: 24,
                          right: 24,
                        ),
                        child: Container(
                          height: 88,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: space!.photos!.map((item) {
                              return Container(
                                margin: const EdgeInsets.only(left: 24),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.network(
                                    item,
                                    width: 110,
                                    height: 88,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                      // NOTE : LOCATION
                      const SizedBox(
                        height: 30,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 24, right: 24),
                        child: Text(
                          "Location",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 6,
                      ),

                      Padding(
                        padding: const EdgeInsets.only(left: 24, right: 24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "${space!.address}\n${space!.city}",
                              style: TextStyle(
                                color: greyColor,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                // launcerUrl(
                                //     "https://goo.gl/maps/yHh4GDfoNqHEJ4j68");
                                launcerUrl(space!.mapUrl);
                              },
                              child: Image.asset(
                                "assets/images/map.png",
                                width: 40,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            launcerUrl("https://wa.me/6283813333480");
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              purpleColor,
                            ),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(17),
                              ),
                            ),
                          ),
                          child: Container(
                            padding:
                                const EdgeInsets.fromLTRB(120, 11, 118, 11),
                            child: const Text(
                              "Book Now",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 30,
                left: 24,
                right: 24,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset(
                      "assets/images/btn_back.png",
                      width: 40,
                    ),
                  ),
                  Image.asset(
                    "assets/images/btn_wishlist.png",
                    width: 40,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
