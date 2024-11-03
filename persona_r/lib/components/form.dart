import 'package:flutter/material.dart';

class MyForm extends StatelessWidget {
  const MyForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Educational level',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 5),
          TextFormField(
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.black54),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.blue.shade400),
              ),
              hintText: "e.g., Bachelor's degree",
              hintStyle: TextStyle(
                  fontSize: 16,
                  color: Colors.grey.shade400,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w300),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Years of Experience',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 5),
          TextFormField(
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.black54),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.blue.shade400),
                ),
                hintText: 'Enter your years of experience',
                hintStyle: TextStyle(
                    fontSize: 16,
                    color: Colors.grey.shade400,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w300)),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Industry',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 5),
          TextFormField(
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.black54),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.blue.shade400),
              ),
              hintText: 'e.g., tech, healthcare, finance',
              hintStyle: TextStyle(
                  fontSize: 16,
                  color: Colors.grey.shade400,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w300),
            ),
          ),
          Text(
            'Location',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 5),
          TextFormField(
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.black54),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.blue.shade400),
              ),
              hintText: 'e.g., San Fransisco',
              hintStyle: TextStyle(
                  fontSize: 16,
                  color: Colors.grey.shade400,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w300),
            ),
          ),
        ],
      ),
    );
  }
}
