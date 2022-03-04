import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth_app/auth_controller.dart';
import 'package:flutter_firebase_auth_app/widgets/appText.dart';
import 'package:get/get.dart';

import '../widgets/appButton.dart';
import '../widgets/appHeadImage.dart';
import '../widgets/appTextFields.dart';

class SignUpPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SignUpPage();
} // SignUpPage Class

class _SignUpPage extends State<SignUpPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    List images = [
      "g.png",
      "t.png",
      "f.png",
    ];
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Head Image and CircularAvatar Container
            AppHeadImage(
              child: Column(
                children: [
                  SizedBox(
                    height: h * 0.17,
                  ),
                  const CircleAvatar(
                    backgroundColor: Colors.white70,
                    radius: 50,
                    backgroundImage: AssetImage("img/profile.jpg"),
                  ),
                ],
              ),
            ),

            // Heading and textFields Container
            Container(
              // TextFields Container
              margin: const EdgeInsets.only(left: 20, right: 20),
              width: w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 50,
                  ),

                  // TextField Container
                  AppTextFields(
                    hintText: "Email",
                    prefixIcon: Icon(
                      Icons.email,
                      color: Colors.green[400],
                    ),
                    controller: emailController,
                  ),

                  SizedBox(
                    height: w * 0.04,
                  ),
                  AppTextFields(
                    hintText: "Password",
                    prefixIcon:  Icon(
                      Icons.password,
                      color: Colors.green[400],
                    ),
                    isPassField: true,
                    controller: passwordController,
                  ),
                  SizedBox(
                    height: w * 0.04,
                  ),
                ],
              ),
            ),

            SizedBox(
              height: 70,
            ),

            // Sign Up Button Container
            GestureDetector(
              onTap: () {
                AuthController.instance.register(
                    emailController.text.trim(), passwordController.text.trim());
              },
              child: const AppButton(
                btnText: 'Sign Up',
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: w * 0.02,
            ),

            // have ana account Text
            GestureDetector(
              onTap: () {
                Get.back();
              },
              child: AppText(
                text: "Have an account",
                fontSize: 24,
                color: Colors.green[400],
              ),
            ),

            SizedBox(
              height: w * 0.08,
            ),

            // SignUp method Text
            AppText(
              text: "Sign up using one of the following",
              fontSize: 18,
              color: Colors.green[400],
            ),

            // SignUP Methods Icons (Circle Images)
            Wrap(
                children: List<Widget>.generate(3, (index) {
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.green[200],
                  child: CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage(
                      "img/" + images[index],
                    ),
                  ),
                ),
              );
            } // index return
                    )),
          ],
        ),
      ),
    );
  } // build
}
