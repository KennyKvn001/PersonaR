// form.dart
import 'package:flutter/material.dart';
import 'package:persona_r/salary_provider.dart';
import 'package:provider/provider.dart';

class MyForm extends StatefulWidget {
  const MyForm({super.key});

  @override
  State<MyForm> createState() => MyFormState();
}

class MyFormState extends State<MyForm> {
  final _formKey = GlobalKey<FormState>();
  final _ageController = TextEditingController();
  final _genderController = TextEditingController();
  final _educationController = TextEditingController();
  final _experienceController = TextEditingController();
  final _jobTitleController = TextEditingController();

  @override
  void dispose() {
    _ageController.dispose();
    _genderController.dispose();
    _educationController.dispose();
    _experienceController.dispose();
    _jobTitleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Age',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 5),
            TextFormField(
              controller: _ageController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.black54),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.blue.shade400),
                ),
                hintText: "e.g., 23",
                hintStyle: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade400,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w300,
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your age';
                }
                if (int.tryParse(value) == null) {
                  return 'Please enter a valid age';
                }
                return null;
              },
            ),
            SizedBox(height: 5),
            Text(
              'Job Title',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 5),
            TextFormField(
              controller: _jobTitleController,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.black54),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.blue.shade400),
                ),
                hintText:
                    "e.g., Software Engineer, Data Scientist, Product Manager",
                hintStyle: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade400,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w300,
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your job title';
                }
                return null;
              },
            ),
            SizedBox(height: 5),
            Text(
              'Gender',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 5),
            TextFormField(
              controller: _genderController,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.black54),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.blue.shade400),
                ),
                hintText: 'e.g., Male or Female Only.',
                hintStyle: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade400,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w300,
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your gender';
                }
                if (!['male', 'female', 'Male', 'Female'].contains(value)) {
                  return 'Please enter either Male or Female';
                }
                return null;
              },
            ),
            SizedBox(height: 5),
            Text(
              'Educational level',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 5),
            TextFormField(
              controller: _educationController,
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
                  fontSize: 14,
                  color: Colors.grey.shade400,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w300,
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your educational level';
                }
                return null;
              },
            ),
            SizedBox(height: 5),
            Text(
              'Years of Experience',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 5),
            TextFormField(
              controller: _experienceController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.black54),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.blue.shade400),
                ),
                hintText: 'e.g., Enter your years of experience',
                hintStyle: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade400,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w300,
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your years of experience';
                }
                if (double.tryParse(value) == null) {
                  return 'Please enter a valid number';
                }
                return null;
              },
            ),
          ],
        ),
      ),
    );
  }

  bool validateAndSubmit() {
    if (_formKey.currentState!.validate()) {
      context.read<SalaryProvider>().predictSalary(
            age: int.parse(_ageController.text),
            gender: _genderController.text,
            degree: _educationController.text,
            jobTitle: _jobTitleController.text,
            experience: double.parse(_experienceController.text),
          );
      return true;
    }
    return false;
  }
}
