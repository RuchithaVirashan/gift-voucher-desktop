import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gift_voucher_desktop/screens/details.dart';

import '../components/common/default_text.dart';
import '../components/common/progess_bar.dart';
import '../components/home/elementCard.dart';
import '../globle/constants.dart';
import '../globle/page_transition.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, String>> elementCardData = [
    {
      'name': 'Eargle Fasion',
      'left': '22',
      'imageurl': 'assets/1.jpeg',
    },
    {
      'name': 'Space Toys',
      'left': '100',
      'imageurl': 'assets/2.jpeg',
    },
    {
      'name': 'Bear Shirts',
      'left': '0',
      'imageurl': 'assets/3.jpeg',
    },
    {
      'name': 'HA Mart',
      'left': '8',
      'imageurl': 'assets/4.jpeg',
    },
    {
      'name': 'Rat Design',
      'left': '10',
      'imageurl': 'assets/5.jpeg',
    },
    {
      'name': 'RV Group',
      'left': '97',
      'imageurl': 'assets/6.jpeg',
    },
    {
      'name': 'Pirate Trends',
      'left': '48',
      'imageurl': 'assets/7.jpeg',
    },
  ];

  var isLoading = false;
  double progressValue = 0.0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double relativeWidth = size.width / Constants.referenceWidth;
    double relativeHeight = size.height / Constants.referenceHeight;
    return SafeArea(
      child: Scaffold(
        body: isLoading
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: relativeHeight * 50.0,
                      left: relativeWidth * 120.0,
                      right: relativeWidth * 120.0,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100.0),
                      child: const Image(
                        image: AssetImage('assets/logooo.jpeg'),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: relativeHeight * 20.0,
                      left: relativeWidth * 120.0,
                      right: relativeWidth * 120.0,
                    ),
                    child: CommonProgressBar(
                      percentage: progressValue,
                    ),
                  ),
                ],
              )
            : CustomScrollView(
                slivers: [
                  SliverList(
                    delegate: SliverChildListDelegate([
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  top: relativeHeight * 40.0,
                                  left: relativeWidth * 30.0,
                                  right: relativeWidth * 30),
                              child: const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        DefaultText(
                                          colorR: Color(0xFF22242E),
                                          content: 'No More Hassle:',
                                          fontSizeR: 32,
                                          fontWeightR: FontWeight.w800,
                                          textAlignR: TextAlign.start,
                                        ),
                                        DefaultText(
                                          colorR: Color(0xFF22242E),
                                          content:
                                              'Find Your Voucher for Send Your Loving One',
                                          fontSizeR: 25,
                                          fontWeightR: FontWeight.w400,
                                          textAlignR: TextAlign.start,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                left: relativeWidth * 20,
                                top: relativeHeight * 40,
                                right: relativeWidth * 20,
                              ),
                              child: Stack(
                                children: [
                                  Column(
                                    children: [
                                      SizedBox(
                                          child: GridView.builder(
                                        shrinkWrap: true,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemCount: elementCardData.length,
                                        itemBuilder: (context, index) {
                                          return GestureDetector(
                                            onTap: () {
                                              print("click");
                                              Navigator.of(context)
                                                      .push(
                                                      createRoute(
                                                           DetailsScreen(name:elementCardData[index]
                                                      ['name'], left: elementCardData[index]
                                                      ['left'], img: elementCardData[index]
                                                      ['imageurl'],),
                                                          TransitionType
                                                              .upToDown),
                                                    );
                                            },
                                            child: ElementCard(
                                              name: elementCardData[index]
                                                      ['name'] ??
                                                  '',
                                              left: elementCardData[index]
                                                      ['left'] ??
                                                  '',
                                              imageurl: elementCardData[index]
                                                      ['imageurl'] ??
                                                  '',
                                            ),
                                          );
                                        },
                                        gridDelegate:
                                            SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: size.width <= 600
                                              ? 1
                                              : size.width <= 900
                                                  ? 2
                                                  : 3,
                                          childAspectRatio: 1.0,
                                          crossAxisSpacing: 20,
                                          mainAxisSpacing: 20,
                                          mainAxisExtent: 200,
                                        ),
                                      )),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ]),
                    ]),
                  )
                ],
              ),
      ),
    );
  }
}
