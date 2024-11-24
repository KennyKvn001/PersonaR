import 'package:flutter/material.dart';
import 'package:persona_r/components/appbar.dart';
import 'package:persona_r/components/button.dart';
import 'package:persona_r/components/form.dart';
import 'package:persona_r/pages/result_page.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final formKey = GlobalKey<MyFormState>();

  void _showResults(BuildContext context) {
    final formState = formKey.currentState;
    if (formState != null && formState.validateAndSubmit()) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ResultPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 237, 237, 237),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Appbar(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: SizedBox(
                height: 200,
                width: 400,
                child: Card(
                  color: const Color.fromARGB(255, 218, 218, 218),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Center(
                      child: DefaultTextStyle(
                        style: const TextStyle(
                          fontSize: 30,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                        child: AnimatedTextKit(
                          animatedTexts: [
                            TyperAnimatedText(
                              'Discover your Salary Based on Age',
                              speed: const Duration(milliseconds: 50),
                            ),
                            TyperAnimatedText(
                              'Discover your Salary Based on Education',
                              speed: const Duration(milliseconds: 50),
                            ),
                            TyperAnimatedText(
                              'Discover your Salary Based on Job',
                              speed: const Duration(milliseconds: 50),
                            ),
                          ],
                          repeatForever: true,
                          pause: const Duration(seconds: 2),
                          displayFullTextOnTap: true,
                          stopPauseOnTap: true,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 5),
            MyForm(key: formKey),
            const SizedBox(height: 20),
            MyButton(
              label: 'DISCOVER NOW',
              onTap: () => _showResults(context),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
