import 'package:flick/utils/Colors.dart';
import 'package:flutter/material.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //logo
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Image.asset(
                  "lib/images/nike.png",
                  height: 240,
                ),
              ),

              const SizedBox(height: 40),

              // title
              const Text(
                "Just Do It",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),

              const SizedBox(height: 24),

              // subtitle
              Text(
                "Brand new sneakers and custom kicks made with premium quality",
                style: TextStyle(fontSize: 16, color: subTitleTextColor),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 24),

              // start new button
              GestureDetector(
                // onTap: () =>
                //     Navigator.push(
                //         context, MaterialPageRoute(builder: (context) => HomePage())),
                child: Container(
                  decoration: BoxDecoration(
                      color: darkGreyButtonBackground,
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                        "Shop Now",
                        style: TextStyle(
                            color: whiteTextColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
