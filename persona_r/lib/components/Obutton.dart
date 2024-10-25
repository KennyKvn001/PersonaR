import 'package:flutter/material.dart';

class OauthButton extends StatelessWidget {
  final String icon;

  final Function()? onTap;

  const OauthButton({super.key, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(20),
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
        child: Image.asset(icon),
      ),
    );
  }
}
