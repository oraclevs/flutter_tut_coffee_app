import 'package:coffee_shop/screens/home_index.dart';
import 'package:coffee_shop/theme/colors.dart';
import 'package:flutter/material.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              color: Colors.black,
              child: Column(
                children: [
                  SizedBox(
                    height: 550,
                    width: double.infinity,
                    child: Image.asset(
                      'Assets/Images/coffeeSix.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: SizedBox(
              width: 350,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 300,
                    child: Text(
                      'Fall in Love with Coffee in Blissful Delight!',
                      style: TextStyle(
                        color: AppColor.onSecondaryColor,
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    width: 250,
                    child: Text(
                      'Welcome to our cozy coffee shop  where every cup is a delight to you.',
                      style: TextStyle(
                        color: AppColor.onSecondaryColor,
                        fontSize: 12,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    width: 300,
                    child: FilledButton(
                      style: FilledButton.styleFrom(
                        backgroundColor: AppColor.primaryColor,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomeIndex()),
                        );
                      },
                      child: Text('Get Started'),
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
