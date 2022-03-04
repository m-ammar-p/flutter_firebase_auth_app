import 'package:flutter/material.dart';

class AppHeadImage extends StatelessWidget {
  Widget? child;
   AppHeadImage({Key? key,
    this.child,
  }) : super(key: key);

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
          image: AssetImage("img/headimage.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: child,
    );
  } // build
} // AppHeadImage Class
