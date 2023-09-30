import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/introscreen_controller.dart';

class Intro_screen1 extends StatefulWidget {
  const Intro_screen1({Key? key}) : super(key: key);

  @override
  State<Intro_screen1> createState() => _Intro_screen1State();
}

class _Intro_screen1State extends State<Intro_screen1> {
  IntroAccessController introAccessController = Get.put(IntroAccessController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey, // Set background color to blue grey
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/gif/intro_1.png"),
                  fit: BoxFit.cover, // Adjust the image fit
                ),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            SizedBox(height: 40),
            Text(
              "Welcome to Chat App", // Updated welcome message
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white, // Set text color to white
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Chat with your friends, share photos & videos with high quality.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.white70, // Set text color to light white
                fontSize: 18,
              ),
            ),
            SizedBox(height: 40),
            GestureDetector(
              onTap: () async {
                introAccessController.introAccessControllerTrueValue(val: true);
                Get.offNamed('/intro_screen2');
              },
              child: Container(
                alignment: Alignment.center,
                height: 60,
                width: 200,
                decoration: BoxDecoration(
                  color: Colors.green, // Set button color to green
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Text(
                  "Next",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: Colors.white, // Set text color to white
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
