import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth_app/auth_controller.dart';
import 'package:flutter_firebase_auth_app/screens/signup_page.dart';
import 'package:flutter_firebase_auth_app/widgets/appHeadImage.dart';
import 'package:flutter_firebase_auth_app/widgets/appTextFields.dart';
import 'package:get/get.dart';

import '../widgets/appText.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          // Head Image Container
          AppHeadImage(),

          // Heading and textFields Container
          Container(
            // Heading and textFields Container
            margin: const EdgeInsets.only(left: 20, right: 20),
            width: w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Text
                AppText(text: 'Hello', fontSize: 70,fontWeight: FontWeight.bold,),
                AppText(text: 'Sign in to your account', fontSize: 20, color: Colors.grey,),

                const SizedBox(
                  height: 50,
                ),

                // Textfiled Container
                AppTextFields(hintText: "Email",
                  prefixIcon: Icon(Icons.email, color: Colors.deepOrangeAccent,),
                  controller: emailController,
                ),

                SizedBox(height: 20,),
                AppTextFields(hintText: "Password",
                  prefixIcon: Icon(Icons.password, color: Colors.deepOrangeAccent,)
                  ,isPassField: true,
                  controller: passwordController,
                ),

                SizedBox(
                  height: 20,
                ),
                // Forgot Password Row
                Row(
                  // Forgot Password Row
                  children: [
                    Spacer(),
                    Text(
                      "Forgot your Password?",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          SizedBox(
            height: 70,
          ),

          // Sign In Button Container
          GestureDetector(
            onTap: () {
              AuthController.instance.login(
                  emailController.text.trim(), passwordController.text.trim());
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
                  "Sign In",
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

          // Register Account Text
          RichText(
            text: TextSpan(
                text: "Don\'t have an account?",
                style: TextStyle(
                  color: Colors.grey[500],
                  fontSize: 20,
                ),
                children: [
                  TextSpan(
                    text: " Create",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => Get.to(() => SignUpPage()),
                  ),
                ]),
          ),
        ],
      ),
    );
  } // build
} // _LoginPageState Class
