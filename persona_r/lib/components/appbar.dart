import 'package:flutter/material.dart';
import 'package:persona_r/components/profile.dart';

class Appbar extends StatelessWidget {
  const Appbar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Row(
          children: [
            Text(
              'PersonaR',
              style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'JacquesFrancois'),
            ),
            Spacer(),
            ProfileMenu(),
          ],
        ),
      ),
    );
  }
}
