import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../components/common/default_text.dart';
import '../../components/common/progess_bar.dart';
import '../../components/home/elementCard.dart';
import '../constants.dart';
import '../page_transition.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, String>> elementCardData = [
    {
      'name': 'Fuel',
      'time': '',
      'imageurl': 'assets/fuel.png',
    },
    {
      'name': 'Car Wash',
      'time': '',
      'imageurl': 'assets/car-service.png',
    },
    {
      'name': 'Battery',
      'time': '',
      'imageurl': 'assets/car-battery.png',
    },
    {
      'name': 'Tyres',
      'time': '',
      'imageurl': 'assets/tyre.png',
    },
    {
      'name': 'Engine Oil',
      'time': '',
      'imageurl': 'assets/engine-oil.png',
    },
    {
      'name': 'Insurance',
      'time': '',
      'imageurl': 'assets/car-insurance.png',
    },
    {
      'name': 'Emergency Fuel',
      'time': '',
      'imageurl': 'assets/emergency.png',
    },
  ];

  var isLoading = false;
  bool showedDialog = false;
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
                            image: AssetImage('assets/logo_bg.png'),
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
                : CustomScrollView(slivers: [
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
                                                'Find Your Place for All Your Car Needs',
                                            fontSizeR: 25,
                                            fontWeightR: FontWeight.w400,
                                            textAlignR: TextAlign.start,
                                          ),
                                        ],
                                      ),
                                    ),
                                    // SizedBox(
                                    //   width: relativeWidth * 30,
                                    // ),
                                    // Container(
                                    //   width: relativeWidth * 80.0,
                                    //   height: relativeHeight * 80.0,
                                    //   decoration: const BoxDecoration(
                                    //     shape: BoxShape.circle,
                                    //     color: Colors.white,
                                    //   ),
                                    //   child: IconButton(
                                    //     icon: const Icon(
                                    //       Icons.notifications_active_outlined,
                                    //       size: 30,
                                    //     ),
                                    //     onPressed: () {
                                    //       print('objectttttttttt');
                                    //       AuthService().signOut();
                                    //       Navigator.of(context).pushReplacement(
                                    //         createRoute(const LoginScreen(),
                                    //             TransitionType.upToDown),
                                    //       );
                                    //     },
                                    //     color: Colors.blue,
                                    //   ),
                                    // ),
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
                                                  // print("object");
                                                  // index == 0
                                                  //     ? Navigator.of(context)
                                                  //         .push(
                                                  //         createRoute(
                                                  //             const MapPage(),
                                                  //             TransitionType
                                                  //                 .upToDown),
                                                  //       )
                                                  //     : null;
                                                },
                                                child: ElementCard(
                                                  name: elementCardData[index]
                                                          ['name'] ??
                                                      '',
                                                  time: elementCardData[index]
                                                          ['time'] ??
                                                      '',
                                                  imageurl:
                                                      elementCardData[index]
                                                              ['imageurl'] ??
                                                          '',
                                                ),
                                              );
                                            },
                                            gridDelegate:
                                                const SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 2,
                                              childAspectRatio: 1.0,
                                              crossAxisSpacing: 20,
                                              mainAxisSpacing: 20,
                                              mainAxisExtent: 160,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ]),
                      ]),
                    )
                  ])));
  }
}