import 'package:flutter/material.dart';

import '../../globle/constants.dart';
import '../common/default_text.dart';

class ElementCard extends StatelessWidget {
  final String name;
  final String left;
  final String imageurl;
  const ElementCard(
      {Key? key,
      required this.name,
      required this.left,
      required this.imageurl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double relativeWidth = size.width / Constants.referenceWidth;
    double relativeHeight = size.height / Constants.referenceHeight;

    return Container(
      width: relativeWidth * 200,
      height: relativeHeight * 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        shape: BoxShape.rectangle,
        // color: Colors.white,
        image: DecorationImage(
          image: AssetImage(imageurl),
          fit: BoxFit.cover,
          opacity: 0.5,
        ),
      ),
      child: Card(
        color: Colors.transparent,
        // elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Padding(
                padding: EdgeInsets.only(top: relativeHeight * 20),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 2.0),
                      image: DecorationImage(
                        image: AssetImage(imageurl),
                        fit: BoxFit.cover,
                      ),
                    ),
                    width: relativeWidth * 80,
                    height: relativeHeight * 80,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: DefaultText(
                      content: name,
                      fontSizeR: 20,
                      colorR: Color(0xFFFFFFFF),
                      textAlignR: TextAlign.center,
                      fontWeightR: FontWeight.w700,
                    ),
                  ),
                  SizedBox(
                    height: relativeHeight * 5,
                  ),
                  Center(
                    child: DefaultText(
                      content: '${left} Lefts',
                      fontSizeR: 15,
                      colorR: Color(0xDAFFFFFF),
                      textAlignR: TextAlign.center,
                      fontWeightR: FontWeight.w500,
                    ),
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
