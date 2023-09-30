import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controllers/indexedstack_controller.dart';
import '../../utills/utills.dart';
import '../controllers/login_out_controllers.dart';
import '../controllers/theme_controller.dart';
import '../utills/helper/firebase_auth_helper.dart';

class Login_page extends StatefulWidget {
  const Login_page({Key? key}) : super(key: key);

  @override
  State<Login_page> createState() => _Login_pageState();
}

class _Login_pageState extends State<Login_page> {
  LogINOutController logINOutController = Get.put(LogINOutController());
  IndexedStackValController indexedStackValController = Get.put(IndexedStackValController());
  ThemeController themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        color: themeController.darkModeModel.isdark ? Colors.black : Colors.white,
        padding: const EdgeInsets.all(16),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Welcome Back!",
              style: GoogleFonts.aBeeZee(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: themeController.darkModeModel.isdark ? Colors.white : Colors.black,
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: TextFormField(
                controller: signinemailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: "Email",
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                validator: (val) {
                  if (val!.isEmpty) {
                    return "Please enter email";
                  } else {
                    return null;
                  }
                },
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: TextFormField(
                controller: signinpasswordController,
                keyboardType: TextInputType.text,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Password",
                  prefixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                validator: (val) {
                  if (val!.isEmpty) {
                    return "Please enter password";
                  } else {
                    return null;
                  }
                },
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                ValidateAndSignIn();
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.blueAccent.shade100,
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                "Sign In",
                style: TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "or continue with",
              style: GoogleFonts.aBeeZee(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(
                  onPressed: () async {
                    Map<String, dynamic> data =
                    await FirebaseAuthHelper.firebaseAuthHelper.signInWithGoogle();

                    if (data['user'] != null) {
                      Get.snackbar("SUCCESSFULLY", "Login Successfully with Google",
                          backgroundColor: Colors.green);
                      Get.offNamed('/', arguments: data['user']);
                    } else {
                      Get.snackbar("FAILURE", data['msg'], backgroundColor: Colors.red);
                    }
                  },
                  style: OutlinedButton.styleFrom(
                    primary: Colors.blueAccent,
                    side: BorderSide(color: Colors.blueAccent),
                    padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 7),

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.supervised_user_circle),
                      SizedBox(width: 8),
                      Text(" Sign in with Google "),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                OutlinedButton(
                  onPressed: () async {
                    Map<String, dynamic> data =
                    await FirebaseAuthHelper.firebaseAuthHelper.signInAnonymously();

                    if (data['user'] != null) {
                      Get.snackbar("SUCCESSFULLY", "Login Successfully with Anonymous",
                          backgroundColor: Colors.green);
                      Get.offNamed('/', arguments: data['user']);
                      logINOutController.logInOutTrueValue();
                    } else {
                      Get.snackbar("NOT SUCCESSFULLY", data['msg'], backgroundColor: Colors.red);
                    }
                  },
                  style: OutlinedButton.styleFrom(
                    primary: Colors.blueAccent,
                    side: BorderSide(color: Colors.blueAccent),
                    padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 7),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.supervised_user_circle),
                      SizedBox(width: 8),
                      Text("Sign in Anonymously"),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text.rich(
              TextSpan(
                text: "Don't have an account? ",
                style: TextStyle(
                  fontSize: 16,
                ),
                children: [
                  TextSpan(
                    text: "Sign Up",
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Colors.blueAccent,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        setState(() {
                          indexedStackValController.indexedStackModel.indexstackval = 1;
                        });
                      },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> ValidateAndSignIn() async {
  if (signInformkey.currentState!.validate()) {
    signInformkey.currentState!.save();

    Map<String, dynamic> data = await FirebaseAuthHelper.firebaseAuthHelper.signInWithEmailPassword(
      Email: signinemailController.text,
      Password: signinpasswordController.text,
    );

    if (data['user'] != null) {
      Get.snackbar(
        "SUCCESSFULLY",
        "Successfully login....😊",
        backgroundColor: Colors.green,
        duration: const Duration(seconds: 1),
      );
      Get.offNamed('/', arguments: data['user']);
    } else {
      Get.snackbar(
        "NOT SUCCESSFULLY",
        data['msg'],
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 1),
      );
    }
  }
}
