import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomBookVaultWidget extends StatelessWidget {
  final double screenHeight;
  final double screenWidth;
  final String imagePath;
  final String text;
  final double imageHeightFactor;
  final double imageWidthFactor;
  final double textSizeFactor;
  final EdgeInsetsGeometry padding;
  final Color? svgcolour;

  const CustomBookVaultWidget({
    Key? key,
    required this.screenHeight,
    required this.screenWidth,
    required this.imagePath,
    required this.text,
    this.imageHeightFactor = 0.25,
    this.imageWidthFactor = 0.75,
    this.textSizeFactor = 0.045,
    this.padding = const EdgeInsets.only(top: 0), // Default padding
    this.svgcolour = Colors.black
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding, // Customizable padding
      child: Align(
        alignment: Alignment.topCenter,
        child: SizedBox(
          width: screenWidth * 0.65,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRect(
                child: Align(
                  alignment: Alignment.topCenter,
                  child: SvgPicture.asset(
                    imagePath,
                    width: screenWidth * imageWidthFactor,
                    height: screenHeight * imageHeightFactor,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Text(
                text,
                style: TextStyle(
                  color: svgcolour,
                  fontSize:  screenWidth * textSizeFactor,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
