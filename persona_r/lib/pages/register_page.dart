import 'package:flutter/material.dart';
import 'package:persona_r/components/Obutton.dart';
import 'package:persona_r/components/button.dart';
import 'package:persona_r/components/text_field.dart';
import 'package:persona_r/pages/login_page.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // register user in method
  void registeredUser() {}

  // Oauth user method
  void oauthUser() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
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
                        fontFamily: 'JacquesFrancois'),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              'SignUp',
              style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            MyTextField(
              controller: usernameController,
              hintText: 'Username',
              obscureText: false,
            ),
            SizedBox(
              height: 20,
            ),
            MyTextField(
              controller: emailController,
              hintText: 'Email',
              obscureText: false,
            ),
            SizedBox(
              height: 20,
            ),
            MyTextField(
              controller: passwordController,
              hintText: 'Password',
              obscureText: true,
            ),
            SizedBox(
              height: 20,
            ),
            MyButton(
              label: 'REGISTER',
              onTap: registeredUser,
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              'or SignUp with',
              style: TextStyle(color: Colors.grey.shade700, fontSize: 16),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OauthButton(
                  icon: 'assets/Facebook.png',
                  onTap: oauthUser,
                ),
                SizedBox(
                  width: 25,
                ),
                OauthButton(
                  icon: 'assets/google.png',
                  onTap: oauthUser,
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an account?',
                  style: TextStyle(color: Colors.grey.shade700, fontSize: 16),
                ),
                SizedBox(
                  width: 5,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(color: Colors.blue, fontSize: 16),
                  ),
                )
              ],
            )
          ]),
    );
  }
}