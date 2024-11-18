import 'package:flutter/cupertino.dart';
import 'package:persona_r/components/button.dart';
import 'package:flutter/material.dart';
import 'package:persona_r/pages/home_page.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

  // Navigation method to home page
  void _navigateToHome(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 230,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 50.0),
                child: Center(
                  child: Text(
                    'PersonaR',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 48,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'JacquesFrancois',
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 40),
            Container(
              width: 350,
              height: 300,
              child: Image.asset(
                'assets/rb_145527.png',
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "WELCOME TO SALARY PREDICTOR",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                      'Discover your earning potential with just a few clicks!'),
                ],
              ),
            ),
            SizedBox(height: 50),
            MyButton(
              label: 'GET STARTED',
              onTap: () => _navigateToHome(context),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
