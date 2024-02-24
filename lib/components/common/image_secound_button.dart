import 'package:flutter/material.dart';

import '../../globle/constants.dart';

class imageScoundButton extends StatelessWidget {
  final String buttonName;
  final Color bcolor;
  final Color fcolor;
  final Color tcolor;
  final double radius;
  final double minHeight;
  final Color borderColor;
  final void Function()? onPressed;
  final String imagePath;

  const imageScoundButton({
    super.key,
    required this.buttonName,
    required this.bcolor,
    required this.tcolor,
    required this.radius,
    required this.fcolor,
    required this.minHeight,
    required this.borderColor,
    required this.onPressed,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double relativeWidth = size.width / Constants.referenceWidth;
    double relativeHeight = size.height / Constants.referenceHeight;
    return TextButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(bcolor),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(radius)),
          ),
        ),
        minimumSize:
            MaterialStateProperty.all(Size(double.infinity, minHeight)),
        padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(
            horizontal: 20.0, 
            vertical: 8.0, 
          ),
        ),
      ),
      onPressed: () {
        onPressed!();
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            buttonName,
            style: TextStyle(
              color: tcolor,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          ClipRRect(
            child: Image(
              image: AssetImage(imagePath),
              height: relativeHeight * 40,
              width: relativeWidth * 40,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
