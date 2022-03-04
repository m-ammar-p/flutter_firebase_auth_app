import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth_app/auth_controller.dart';
import 'package:flutter_firebase_auth_app/signup_page.dart';
import 'package:get/get.dart';

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
          Container(
            // Head Image Container
            width: w,
            // 1/3 height of the screen
            height: h * 0.3,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("img/signup.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: h * 0.16,
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
            height: 70,
          ),

          // Welcome And email Text
          Container(
            width: w,
            margin: const EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Welcome Text
                Text(
                  "Welcome",
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
                ),
                // Email Text
                Text(
                  email,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 200,
          ),
          // Sign Out Button Container
          GestureDetector(
            onTap: () {
              AuthController.instance.logout();
            },
            child: Container(
              // Sign In Button Container
              width: w * 0.5,
              height: h * 0.08,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                image: DecorationImage(
                  image: AssetImage("img/loginbtn.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: Text(
                  "Sign Out ",
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
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
