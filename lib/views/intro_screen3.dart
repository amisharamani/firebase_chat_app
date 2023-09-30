import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Intro_screen3 extends StatefulWidget {
  const Intro_screen3({Key? key}) : super(key: key);

  @override
  State<Intro_screen3> createState() => _Intro_screen3State();
}

class _Intro_screen3State extends State<Intro_screen3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/gif/i3-removebg-preview.png"),
                    fit: BoxFit.cover, // Adjust the image fit
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              SizedBox(height: 40),
              Text(
                "Find Your Chitty", // Updated title text
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black, // Set text color to black
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Chat with your chitty, your daily chatting person.", // Updated description text
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.white, // Set text color to grey
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 30),
              GestureDetector(
                onTap: () async {
                  Get.offNamed('/login_page');
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 60,
                  width: 200,
                  decoration: BoxDecoration(
                    color: Colors.blue, // Set button color to blue
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Text(
                    "Next",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      color: Colors.white, // Set text color to white
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }
}
