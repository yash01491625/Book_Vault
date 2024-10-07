import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Forgotpasswordsvg extends StatelessWidget {

  final String text1;
  final String text2;
  final String imagePath;
  final Color? svgcolour;
  final double screenwidth;
  final double screenheight;

  const Forgotpasswordsvg({
    super.key,
    required this.imagePath,
    required this.text1,
    required this.text2,
    required this.screenwidth,
    required this.screenheight,
    required this.svgcolour
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ClipRect(
          child: Align(
            alignment: Alignment.topCenter,
            heightFactor: screenheight * 0.0017,
            child: SvgPicture.asset(
              imagePath,
              width: screenwidth * 0.10,
              height: screenheight * 0.10,
              fit: BoxFit.contain,
              colorFilter: ColorFilter.mode(
                svgcolour!, // Replace this with your desired color
                BlendMode.srcIn, // This mode allows the color to replace the SVG's color
              ),
            ),
          ),
        ),
        Text(
            text1,
            style: TextStyle(
              color: svgcolour,
              fontSize: screenwidth * 0.07,
              fontWeight: FontWeight.bold,
            ),
        ),
        SizedBox(height: screenheight * 0.003),
        Text(
          text2,
          style: TextStyle(
            color: svgcolour,
            fontSize: screenwidth * 0.043,
          ),
        ),
      ],
    );
  }
}
