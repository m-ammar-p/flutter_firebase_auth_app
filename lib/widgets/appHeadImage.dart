import 'package:flutter/material.dart';

class AppHeadImage extends StatelessWidget {
  const AppHeadImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Container(

      width: w,
      // 1/3 height of the screen
      height: h * 0.3,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("img/loginimg.png"),
          fit: BoxFit.cover,
        ),
      ),
    );
  } // build
} // AppHeadImage Class
