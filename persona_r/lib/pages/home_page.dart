import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:persona_r/components/appbar.dart';
import 'package:persona_r/components/button.dart';
import 'package:persona_r/components/form.dart';
import 'package:persona_r/pages/result_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

// show results
void _showResults(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => ResultPage()),
  );
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 237, 237, 237),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Appbar(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: SizedBox(
                height: 200,
                width: 400,
                child: Card(
                  color: Color.fromARGB(255, 218, 218, 218),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Center(
                        child: Text(
                          'Discover your Salary Based on Experience',
                          style: TextStyle(
                              fontSize: 30,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            MyForm(),
            SizedBox(
              height: 20,
            ),
            MyButton(
              label: 'DISCOVER NOW',
              onTap: () => _showResults(context),
            )
          ],
        ),
      ),
    );
  }
}
