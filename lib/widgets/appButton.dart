import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String btnText;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  const AppButton({Key? key,
    required this.btnText,
    required this.fontSize,
    required this.fontWeight,
    required this.color
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Container(
      width: w * 0.5,
      height: h * 0.08,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        image: const DecorationImage(
          opacity: 0.9,
          image: AssetImage("img/btnimage.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: Text(
          btnText,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: color,
          ),
        ),
      ),
    );
  } // build
} // AppButton Class
