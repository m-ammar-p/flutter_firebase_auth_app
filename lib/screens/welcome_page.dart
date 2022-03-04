import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth_app/auth_controller.dart';
import 'package:flutter_firebase_auth_app/screens/signup_page.dart';
import 'package:flutter_firebase_auth_app/widgets/appText.dart';
import 'package:get/get.dart';

import '../widgets/appButton.dart';
import '../widgets/appHeadImage.dart';

class WelcomePage extends StatelessWidget {
  String email;

  WelcomePage({Key? key, required this.email}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Head Image Container
          AppHeadImage(
            child: Column(
              children: [
                SizedBox(
                  height: h * 0.17,
                ),
                CircleAvatar(
                  backgroundColor: Colors.white70,
                  radius: 50,
                  backgroundImage: AssetImage("img/profile1.png"),
                ),
              ],
            ),
          ),

          SizedBox(
            height: w * 0.15,
          ),

          // Welcome And email Text
          Container(
            width: w,
            margin: const EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Welcome Text
                const AppText(text: "Welcome",
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
                // Email Text
                AppText(text: email,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.green[400],
                ),

              ],
            ),
          ),
          SizedBox(
            height: w * 0.3,
          ),
          // Sign Out Button Container
          GestureDetector(
            onTap: () {
              AuthController.instance.logout();
            },
            child: const AppButton(
              btnText: 'Sign Out',
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: w * 0.08,
          ),
        ],
      ),
    );
  } // build
}
