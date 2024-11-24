import 'package:flutter/material.dart';
import 'package:persona_r/components/appbar.dart';
import 'package:persona_r/components/button.dart';
import 'package:persona_r/components/display.dart';
import 'package:persona_r/pages/home_page.dart';
import 'package:provider/provider.dart';
import 'package:persona_r/salary_provider.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key});

  void back(BuildContext context) {
    context.read<SalaryProvider>().reset();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HomePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 237, 237, 237),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Appbar(),
            SizedBox(height: 10),
            Text(
              'RESULTS',
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.w500,
                fontFamily: 'Intel',
              ),
            ),
            DisplayContainer(),
            SizedBox(height: 5),
            MyButton(
              label: 'TRY AGAIN',
              onTap: () => back(context),
            ),
            SizedBox(height: 20),
            _buildFeedbackButtons(context),
          ],
        ),
      ),
    );
  }

  Widget _buildFeedbackButtons(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildIconButton(Icons.thumb_up_outlined),
            SizedBox(width: 20),
            _buildIconButton(Icons.thumb_down_outlined),
          ],
        ),
        SizedBox(height: 20),
        GestureDetector(
          onTap: () => back(context),
          child: _buildIconButton(Icons.close, size: Size(100, 50)),
        ),
      ],
    );
  }

  Widget _buildIconButton(IconData icon, {Size size = const Size(50, 50)}) {
    return Container(
      height: size.height,
      width: size.width,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade500),
        color: Color.fromARGB(255, 222, 222, 222),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2.5,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Icon(icon),
    );
  }
}
