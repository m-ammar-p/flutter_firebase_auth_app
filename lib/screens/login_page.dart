import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_auth_app/auth_controller.dart';
import 'package:flutter_firebase_auth_app/screens/signup_page.dart';
import 'package:flutter_firebase_auth_app/widgets/appButton.dart';
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
          SizedBox(height: w * 0.04,),
          // Heading and textFields Container
          Container(
            // Heading and textFields Container
            margin: const EdgeInsets.only(left: 20, right: 20),
            width: w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Text
                const AppText(text: 'Firebase Authentication App',
                  fontSize: 30,
                  fontWeight:
                  FontWeight.bold,color: Colors.black54,),
                AppText(text: 'Sign in to your account', fontSize: 20, color: Colors.green[400],),

                 SizedBox(
                  height: w * 0.08,
                ),

                // TextField Container
                AppTextFields(hintText: "Email",
                  prefixIcon: Icon(Icons.email, color: Colors.green[400],),
                  controller: emailController,
                ),

                SizedBox(height: w * 0.04,),
                AppTextFields(hintText: "Password",
                  prefixIcon: Icon(Icons.password, color: Colors.green[400],)
                  ,isPassField: true,
                  controller: passwordController,
                ),

                SizedBox(height: w * 0.03,),
                // Forgot Password Row
                Row(
                  // Forgot Password Row
                  children:  [
                    Spacer(),
                    AppText(text: "Forgot your Password?",
                      fontSize: 20,
                      color: Colors.green[400],),
                  ],
                ),
              ],
            ),
          ),

          SizedBox(height: w * 0.1,),

          // Sign In Button Container
          GestureDetector(
            onTap: () {
              AuthController.instance.login(
                  emailController.text.trim(), passwordController.text.trim());
            },
            child: const AppButton(btnText: 'Sign In',
              fontSize: 36,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: w * 0.08,
          ),

          // Register Account Text
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppText(text: "Don\'t have an account? ",
                  fontSize: 24,
                  color: Colors.green[400],
                ),

                GestureDetector(
                  onTap: (){
                    Get.to(() => SignUpPage());
                  },
                  child: AppText(text: "Create",
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.green[500],
                  ),
                ),
              ],
            ),
          ),

        ],
      ),
    );
  } // build
} // _LoginPageState Class
