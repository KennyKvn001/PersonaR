import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:persona_r/salary_provider.dart';
import 'package:intl/intl.dart';

class DisplayContainer extends StatelessWidget {
  const DisplayContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SalaryProvider>(
      builder: (context, provider, child) {
        if (provider.isLoading) {
          return _buildLoadingContainer();
        }

        if (provider.error != null) {
          return _buildErrorContainer(provider.error!);
        }

        if (provider.salaryData?.predictedSalary != null) {
          return _buildResultContainer(provider.salaryData!);
        }

        return _buildDefaultContainer();
      },
    );
  }

  Widget _buildLoadingContainer() {
    return Container(
      width: double.infinity,
      height: 350,
      padding: EdgeInsets.all(16.0),
      margin: EdgeInsets.all(20.0),
      decoration: _containerDecoration(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          SizedBox(height: 20),
          Text(
            "Calculating your predicted salary...",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildErrorContainer(String error) {
    return Container(
      width: double.infinity,
      height: 350,
      padding: EdgeInsets.all(16.0),
      margin: EdgeInsets.all(20.0),
      decoration: _containerDecoration(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error_outline, color: Colors.red, size: 48),
          SizedBox(height: 16),
          Text(
            "Error",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          ),
          SizedBox(height: 16),
          Text(
            error,
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildResultContainer(SalaryData data) {
    final currencyFormatter = NumberFormat.currency(
      symbol: '\$',
      decimalDigits: 2,
    );

    return Container(
      width: double.infinity,
      height: 350,
      padding: EdgeInsets.all(16.0),
      margin: EdgeInsets.all(20.0),
      decoration: _containerDecoration(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.attach_money, color: Colors.green, size: 48),
          SizedBox(height: 20),
          Text(
            "Predicted Annual Salary",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          Text(
            currencyFormatter.format(data.predictedSalary),
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          Text(
            "Based on your profile:",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 10),
          Text(
            "${data.jobTitle}\n${data.experience} years experience\n${data.degree}\n${data.gender}, ${data.age} years old",
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildDefaultContainer() {
    return Container(
      width: double.infinity,
      height: 350,
      padding: EdgeInsets.all(16.0),
      margin: EdgeInsets.all(20.0),
      decoration: _containerDecoration(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.info,
            color: Colors.black,
            size: 40,
          ),
          SizedBox(height: 10),
          Text(
            "Fill out the form to get your salary prediction",
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  BoxDecoration _containerDecoration() {
    return BoxDecoration(
      color: Colors.grey[200],
      border: Border.all(color: Colors.grey.shade500),
      borderRadius: BorderRadius.circular(15),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 1,
          blurRadius: 5,
          offset: Offset(0, 3),
        ),
      ],
    );
  }
}
