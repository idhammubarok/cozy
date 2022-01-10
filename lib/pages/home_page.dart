import 'package:cozy/models/guidence.dart';
import 'package:cozy/models/space.dart';
import 'package:cozy/providers/space_provider.dart';
import 'package:cozy/theme.dart';
import 'package:cozy/widgets/bottom_navbar_item.dart';
import 'package:cozy/widgets/card_city.dart';
import 'package:cozy/models/city.dart';
import 'package:cozy/widgets/card_guidance.dart';
import 'package:cozy/widgets/card_space.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var spaceProvider = Provider.of<SpaceProvider>(context);
    // spaceProvider.getRecommendedSpaces();

    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        child: ListView(
          children: [
            // note : Header Title
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Text(
                "Explore Now",
                style: TextStyle(
                  color: blackColor,
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(
              height: 2,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Text(
                "Mencari kosan yang cozy",
                style: TextStyle(
                  color: greyColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Text(
                "Popular Cities",
                style: TextStyle(
                  color: blackColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const SizedBox(height: 16),
            // note : Card Popular Cities
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Container(
                height: 160,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    CardCity(
                      City(
                        id: 1,
                        name: 'Jakarta',
                        imageUrl: 'assets/images/image1.png',
                        isPopular: true,
                      ),
                    ),
                    const SizedBox(width: 20),
                    CardCity(
                      City(
                        id: 1,
                        name: 'Bandung',
                        imageUrl: 'assets/images/image2.png',
                        isPopular: false,
                      ),
                    ),
                    const SizedBox(width: 20),
                    CardCity(
                      City(
                        id: 1,
                        name: 'Surabaya',
                        imageUrl: 'assets/images/image3.png',
                        isPopular: true,
                      ),
                    ),
                    const SizedBox(width: 24),
                  ],
                ),
              ),
            ),
            // NOTE : Recomended Space
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Text(
                "Recomended Space",
                style: TextStyle(
                  color: blackColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: FutureBuilder(
                future: spaceProvider.getRecommendedSpaces(),
                builder: (context, AsyncSnapshot<dynamic> snapshot) {
                  if (snapshot.hasData) {
                    List<Space> data = snapshot.data;

                    int index = 0;
                    return Column(
                      children: data.map((item) {
                        index + 1;

                        return Container(
                          margin: EdgeInsets.only(top: index == 1 ? 0 : 30),
                          child: CardSpace(item),
                        );
                      }).toList(),
                      // children: [
                      //   CardSpace(
                      //     Space(
                      //       id: 1,
                      //       name: "Kuretakeso Hott",
                      //       imageUrl: "assets/images/image4.png",
                      //       price: 25,
                      //       city: "Bandung",
                      //       country: "Germany",
                      //       rating: 4,
                      //     ),
                      //   ),
                      //   const SizedBox(height: 30),
                      //   CardSpace(
                      //     Space(
                      //       id: 2,
                      //       name: "Roemah Nenek",
                      //       imageUrl: "assets/images/image5.png",
                      //       price: 11,
                      //       city: "Seatlle",
                      //       country: "Bogor",
                      //       rating: 5,
                      //     ),
                      //   ),
                      //   const SizedBox(height: 30),
                      //   CardSpace(
                      //     Space(
                      //       id: 3,
                      //       name: "Darrling How",
                      //       imageUrl: "assets/images/image7.png",
                      //       price: 20,
                      //       city: "Jakarta",
                      //       country: "Indonesia",
                      //       rating: 3,
                      //     ),
                      //   ),
                      // ],
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
            const SizedBox(height: 30),
            const Padding(
              padding: EdgeInsets.only(left: 30, right: 30),
              child: Text(
                "Tips & Guidance",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: CardGuidance(
                Guidance(
                  id: 1,
                  name: "City Guidelines",
                  image: "assets/images/icon1.png",
                  date: "Updated 20 Apr",
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: CardGuidance(
                Guidance(
                  id: 2,
                  name: "Jakarta Fairship",
                  image: "assets/images/icon2.png",
                  date: "Updated 11 Dec",
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),

            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        height: 65,
        width: MediaQuery.of(context).size.width - (2 * 30),
        margin: const EdgeInsets.only(right: 30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(23),
          color: const Color(0XFFF6F7F8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BottomNavbarItem(
              imageUrl: 'assets/images/icon_home.png',
              isActive: true,
            ),
            BottomNavbarItem(
              imageUrl: 'assets/images/icon_mail.png',
              isActive: false,
            ),
            BottomNavbarItem(
              imageUrl: 'assets/images/icon_card_solid.png',
              isActive: false,
            ),
            BottomNavbarItem(
              imageUrl: 'assets/images/icon_love_solid.png',
              isActive: false,
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
