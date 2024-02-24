import 'package:flutter/material.dart';
import 'package:gift_voucher_desktop/components/common/image_secound_button.dart';

import '../components/common/image_first_button.dart';
import '../components/common/default_text.dart';
import '../components/common/progess_bar.dart';
import '../globle/constants.dart';
import '../globle/staus/error.dart';

class DetailsScreen extends StatefulWidget {
  final String? name;
  final String? left;
  final String? img;
  const DetailsScreen({
    super.key,
    required this.name,
    required this.left,
    required this.img,
  });

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

var isLoading = false;
double progressValue = 0.0;

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double relativeWidth = size.width / Constants.referenceWidth;
    double relativeHeight = size.height / Constants.referenceHeight;
    return Scaffold(
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
                SliverAppBar.medium(
                  pinned: false,
                  floating: false,
                  backgroundColor: Colors.transparent,
                  title: Padding(
                    padding: EdgeInsets.only(left: relativeWidth * 20),
                    child: const Text(
                      '',
                    ),
                  ),
                ),
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Padding(
                            padding: EdgeInsets.only(top: relativeHeight * 30),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.white, width: 2.0),
                                  image: DecorationImage(
                                    image: AssetImage(widget.img.toString()),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                width: relativeWidth * 200,
                                height: relativeHeight * 200,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: relativeHeight * 30,
                            left: relativeWidth * 100,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              DefaultText(
                                colorR: const Color(0xFF191E1D),
                                content: widget.name.toString(),
                                fontSizeR: 40,
                                fontWeightR: FontWeight.w700,
                                textAlignR: TextAlign.start,
                              ),
                              SizedBox(
                                height: relativeHeight * 10,
                              ),
                              DefaultText(
                                colorR: const Color(0xA0191E1D),
                                content: '${widget.left.toString()} Left',
                                fontSizeR: 20,
                                fontWeightR: FontWeight.w400,
                                textAlignR: TextAlign.start,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(
            vertical: relativeHeight * 20, horizontal: relativeWidth * 100),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: imageFirstButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                minHeight: relativeHeight * 75,
                buttonName: 'Back',
                tcolor: const Color(0xFF154478),
                bcolor: const Color(0x21154378),
                borderColor: Colors.white,
                radius: 15,
                fcolor: Colors.grey,
                imagePath: 'assets/back.png',
              ),
            ),
            SizedBox(
              width: size.width <= 600
                  ? relativeWidth * 150
                  : size.width <= 900
                      ? relativeWidth * 300
                      : relativeWidth * 600,
            ),
            Expanded(
              child: imageScoundButton(
                onPressed: () {
                  showErrorDialog(context, 'Page not created yet.');
                },
                minHeight: relativeHeight * 75,
                buttonName: 'Next',
                tcolor: Colors.white,
                bcolor: const Color(0xFF154478),
                borderColor: Colors.white,
                radius: 15,
                fcolor: Colors.grey,
                imagePath: 'assets/next.png',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
