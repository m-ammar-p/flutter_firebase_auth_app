import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_firebase_auth_app/screens/signup_page.dart';
import 'package:flutter_firebase_auth_app/screens/welcome_page.dart';
import 'package:get/get.dart';
import 'screens/login_page.dart';

class AuthController extends GetxController {
  // Globally accessible in App
  static AuthController instance = Get.find();

  // Firebase instance (User Modle)
  late Rx<User?> _user;

  // For authentication (and navigating to different pages)
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void onReady() {
    super.onReady();

    // Casting it to Rx<User?>
    _user = Rx<User?>(auth.currentUser);

    // To keep track of user (binding user to stream)
    _user.bindStream(auth.userChanges());

    // (Listening any changes all the time)what ever happens to _user(listener),
    // _initialScreen will be notified(callback function)
    ever(_user, _initialScreen);
  } // onReady()

  _initialScreen(User? user) {
    if (user == null) {
      Get.offAll(() => LoginPage());
    } else {
      Get.offAll(() => WelcomePage(email: user.email!));
    }
  } // _initialScreen()

  void register(String email, password) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      Get.snackbar(
        "About User",
        "User Message",
        backgroundColor: Colors.redAccent,
        snackPosition: SnackPosition.BOTTOM,
        titleText: Text(
          "Account creation failed",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        messageText: Text(
          e.toString(),
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ); // snackbar
    } // catch()
  } // register

  void login(String email, password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      Get.snackbar(
        "About Login",
        "Login Message",
        backgroundColor: Colors.redAccent,
        snackPosition: SnackPosition.BOTTOM,
        titleText: Text(
          "Login failed",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        messageText: Text(
          e.toString(),
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ); // snackbar
    } // catch()
  } // login()

  void logout() async {
    await auth.signOut();
  } // logout()

} // AuthController Class
