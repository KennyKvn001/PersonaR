import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SalaryData {
  final int age;
  final String gender;
  final String degree;
  final String jobTitle;
  final double experience;
  final double? predictedSalary;

  SalaryData({
    required this.age,
    required this.gender,
    required this.degree,
    required this.jobTitle,
    required this.experience,
    this.predictedSalary,
  });
}

class SalaryProvider extends ChangeNotifier {
  SalaryData? _salaryData;
  bool _isLoading = false;
  String? _error;

  SalaryData? get salaryData => _salaryData;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> predictSalary({
    required int age,
    required String gender,
    required String degree,
    required String jobTitle,
    required double experience,
  }) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      // Print request data for debugging
      print('Sending request with data:');
      print({
        'age': age,
        'gender': gender,
        'degree': degree,
        'job_title': jobTitle,
        'experience': experience,
      });

      final response = await http.post(
        Uri.parse('https://my-fastapi-wxqz.onrender.com/predict'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'age': age,
          'gender': gender,
          'degree': degree,
          'job_title': jobTitle,
          'experience': experience,
        }),
      );

      print('Response status code: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        _salaryData = SalaryData(
          age: age,
          gender: gender,
          degree: degree,
          jobTitle: jobTitle,
          experience: experience,
          predictedSalary: data['salary_prediction'].toDouble(),
        );
      } else {
        final errorData = jsonDecode(response.body);
        _error = errorData['detail'] ??
            'Failed to get prediction. Please try again.';
      }
    } catch (e) {
      print('Error during prediction: $e');
      _error = 'Error: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void reset() {
    _salaryData = null;
    _error = null;
    _isLoading = false;
    notifyListeners();
  }
}
