import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:persona_r/components/Obutton.dart';
import 'package:persona_r/components/button.dart';
import 'package:persona_r/components/text_field.dart';
import 'package:persona_r/pages/login_page.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // Firebase instance
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  // Show error message to user
  void showErrorMessage(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  // Register user method
  void registeredUser() async {
    // Show loading circle
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    try {
      // Create user with email and password
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      // After successful registration, update the user's display name
      await userCredential.user?.updateDisplayName(usernameController.text);

      // Pop loading circle
      if (context.mounted) Navigator.pop(context);

      // Navigate to login page or home page
      if (context.mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
        );
      }
    } on FirebaseAuthException catch (e) {
      // Pop loading circle
      if (context.mounted) Navigator.pop(context);

      if (e.code == 'weak-password') {
        showErrorMessage('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        showErrorMessage('An account already exists for that email.');
      } else if (e.code == 'invalid-email') {
        showErrorMessage('Please enter a valid email address.');
      } else {
        showErrorMessage(e.message ?? 'Registration failed.');
      }
    }
  }

  // Google OAuth method
  void oauthUser() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) return;

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Sign in with Google credentials
      await _auth.signInWithCredential(credential);

      // Navigate to home page or wherever you want after successful sign-in
      if (context.mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
        );
      }
    } catch (e) {
      showErrorMessage('Failed to sign in with Google: ${e.toString()}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        // Added to prevent overflow when keyboard appears
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
                        fontFamily: 'JacquesFrancois'),
                  ),
                ),
              ),
            ),
            SizedBox(height: 50),
            Text(
              'SignUp',
              style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            MyTextField(
              controller: usernameController,
              hintText: 'Username',
              obscureText: false,
            ),
            SizedBox(height: 20),
            MyTextField(
              controller: emailController,
              hintText: 'Email',
              obscureText: false,
            ),
            SizedBox(height: 20),
            MyTextField(
              controller: passwordController,
              hintText: 'Password',
              obscureText: true,
            ),
            SizedBox(height: 20),
            MyButton(
              label: 'REGISTER',
              onTap: registeredUser,
            ),
            SizedBox(height: 40),
            Text(
              'or SignUp with',
              style: TextStyle(color: Colors.grey.shade700, fontSize: 16),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OauthButton(
                  icon: 'assets/Facebook.png',
                  onTap: () {
                    // Facebook authentication can be implemented here
                    // For now, show a message that it's not implemented
                    showErrorMessage(
                        'Facebook authentication not implemented yet');
                  },
                ),
                SizedBox(width: 25),
                OauthButton(
                  icon: 'assets/google.png',
                  onTap: oauthUser,
                )
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an account?',
                  style: TextStyle(color: Colors.grey.shade700, fontSize: 16),
                ),
                SizedBox(width: 5),
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
            ),
            SizedBox(height: 20), // Added bottom padding
          ],
        ),
      ),
    );
  }
}
