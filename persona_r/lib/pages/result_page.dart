import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:persona_r/components/appbar.dart';
import 'package:persona_r/components/button.dart';
import 'package:persona_r/components/display.dart';
import 'package:persona_r/pages/home_page.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({super.key});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

// Try again
void back(BuildContext context) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 237, 237, 237),
      body: SingleChildScrollView(
        child: Column(children: [
          Appbar(),
          SizedBox(
            height: 10,
          ),
          Text(
            'RESULTS',
            style: TextStyle(
                fontSize: 48, fontWeight: FontWeight.w500, fontFamily: 'Intel'),
          ),
          displayContainer(),
          SizedBox(
            height: 5,
          ),
          MyButton(label: 'TRY AGAIN', onTap: () => back(context)),
          SizedBox(
            height: 20,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
              height: 50,
              width: 50,
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
                  ]),
              child: Icon(Icons.thumb_up_off_alt_rounded),
            ),
            SizedBox(
              width: 20,
            ),
            Container(
              height: 50,
              width: 50,
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
                  ]),
              child: Icon(Icons.thumb_down_rounded),
            ),
          ]),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            },
            child: Container(
              height: 50,
              width: 100,
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
                  ]),
              child: Image.asset('assets/cancel.png'),
            ),
          ),
        ]),
      ),
    );
  }
}
