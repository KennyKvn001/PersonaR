import 'package:flutter/material.dart';
import 'package:persona_r/salary_provider.dart';
import 'package:provider/provider.dart';
import 'package:dropdown_search/dropdown_search.dart';

class MyForm extends StatefulWidget {
  const MyForm({super.key});

  @override
  State<MyForm> createState() => MyFormState();
}

class MyFormState extends State<MyForm> {
  final _formKey = GlobalKey<FormState>();

  final List<String> _genders = ['Male', 'Female'];
  final List<String> _educationLevels = [
    "Bachelor's",
    "Master's",
    "PhD",
  ];
  final List<String> _jobTitles = [
    "Account Manager",
    "Accountant",
    "Administrative Assistant",
    "Business Analyst",
    "Business Development Manager",
    "Business Intelligence Analyst",
    "CEO",
    "Chief Data Officer",
    "Chief Technology Officer",
    "Content Marketing Manager",
    "Copywriter",
    "Creative Director",
    "Customer Service Manager",
    "Customer Service Rep",
    "Customer Service Representative",
    "Customer Success Manager",
    "Customer Success Rep",
    "Data Analyst",
    "Data Entry Clerk",
    "Data Scientist",
    "Database Administrator",
    "DevOps Engineer",
    "Digital Content Producer",
    "Digital Marketing Manager",
    "Director",
    "Director of Business Development",
    "Director of Engineering",
    "Director of Finance",
    "Director of HR",
    "Director of Human Capital",
    "Director of Human Resources",
    "Director of Marketing",
    "Director of Operations",
    "Director of Product Management",
    "Director of Sales",
    "Director of Sales and Marketing",
    "Event Coordinator",
    "Financial Advisor",
    "Financial Analyst",
    "Financial Manager",
    "Graphic Designer",
    "Help Desk Analyst",
    "HR Generalist",
    "HR Manager",
    "Human Resources Director",
    "IT Manager",
    "IT Support",
    "IT Support Specialist",
    "Junior Account Manager",
    "Junior Accountant",
    "Junior Advertising Coordinator",
    "Junior Business Analyst",
    "Junior Business Development Associate",
    "Junior Business Operations Analyst",
    "Junior Copywriter",
    "Junior Customer Support Specialist",
    "Junior Data Analyst",
    "Junior Data Scientist",
    "Junior Designer",
    "Junior Developer",
    "Junior Financial Advisor",
    "Junior Financial Analyst",
    "Junior HR Coordinator",
    "Junior HR Generalist",
    "Junior Marketing Analyst",
    "Junior Marketing Coordinator",
    "Junior Marketing Manager",
    "Junior Marketing Specialist",
    "Junior Operations Analyst",
    "Junior Operations Coordinator",
    "Junior Operations Manager",
    "Junior Product Manager",
    "Junior Project Manager",
    "Junior Recruiter",
    "Junior Research Scientist",
    "Junior Sales Representative",
    "Junior Social Media Manager",
    "Junior Social Media Specialist",
    "Junior Software Developer",
    "Junior Software Engineer",
    "Junior UX Designer",
    "Junior Web Designer",
    "Junior Web Developer",
    "Machine Learning Engineer",
    "Marketing Analyst",
    "Marketing Coordinator",
    "Marketing Manager",
    "Marketing Specialist",
    "Network Engineer",
    "Office Manager",
    "Operations Analyst",
    "Operations Director",
    "Operations Manager",
    "Principal Engineer",
    "Principal Scientist",
    "Product Designer",
    "Product Manager",
    "Product Marketing Manager",
    "Project Engineer",
    "Project Manager",
    "Public Relations Manager",
    "Quality Assurance Engineer",
    "Recruiter",
    "Research Director",
    "Research Scientist",
    "Sales Associate",
    "Sales Director",
    "Sales Executive",
    "Sales Manager",
    "Sales Operations Manager",
    "Sales Representative",
    "Senior Account Executive",
    "Senior Account Manager",
    "Senior Accountant",
    "Senior Business Analyst",
    "Senior Business Development Manager",
    "Senior Consultant",
    "Senior Data Analyst",
    "Senior Data Engineer",
    "Senior Data Scientist",
    "Senior Engineer",
    "Senior Financial Advisor",
    "Senior Financial Analyst",
    "Senior Financial Manager",
    "Senior Graphic Designer",
    "Senior HR Generalist",
    "Senior HR Manager",
    "Senior HR Specialist",
    "Senior Human Resources Coordinator",
    "Senior Human Resources Manager",
    "Senior Human Resources Specialist",
    "Senior IT Consultant",
    "Senior IT Project Manager",
    "Senior IT Support Specialist",
    "Senior Manager",
    "Senior Marketing Analyst",
    "Senior Marketing Coordinator",
    "Senior Marketing Director",
    "Senior Marketing Manager",
    "Senior Marketing Specialist",
    "Senior Operations Analyst",
    "Senior Operations Coordinator",
    "Senior Operations Manager",
    "Senior Product Designer",
    "Senior Product Development Manager",
    "Senior Product Manager",
    "Senior Product Marketing Manager",
    "Senior Project Coordinator",
    "Senior Project Manager",
    "Senior Quality Assurance Analyst",
    "Senior Research Scientist",
    "Senior Researcher",
    "Senior Sales Manager",
    "Senior Sales Representative",
    "Senior Scientist",
    "Senior Software Architect",
    "Senior Software Developer",
    "Senior Software Engineer",
    "Senior Training Specialist",
    "Senior UX Designer",
    "Social Media Manager",
    "Social Media Specialist",
    "Software Developer",
    "Software Engineer",
    "Software Manager",
    "Software Project Manager",
    "Strategy Consultant",
    "Supply Chain Analyst",
    "Supply Chain Manager",
    "System Analyst",
    "Technical Recruiter",
    "Technical Support Specialist",
    "Technical Writer",
    "Training Specialist",
    "UX Designer",
    "UX Researcher",
    "VP of Finance",
    "VP of Operations",
    "Web Developer"
  ];

  String? _selectedGender;
  String? _selectedEducation;
  String? _selectedJobTitle;
  double? _experience;
  double? _age;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTextField(
              title: 'Age',
              hintText: 'Enter your Age, e.g., 23',
              onChanged: (value) => _age = double.tryParse(value),
            ),
            SizedBox(height: 5),
            _buildSearchableDropdown(
              title: "Gender",
              hint: "Male or Female",
              items: _genders,
              selectedItem: _selectedGender,
              onChanged: (value) => setState(() => _selectedGender = value),
            ),
            SizedBox(height: 5),
            _buildSearchableDropdown(
              title: "Educational Level",
              hint: "Bachelor's",
              items: _educationLevels,
              selectedItem: _selectedEducation,
              onChanged: (value) => setState(() => _selectedEducation = value),
            ),
            SizedBox(height: 5),
            _buildSearchableDropdown(
              title: "Job Title",
              hint: "Software Engineer",
              items: _jobTitles,
              selectedItem: _selectedJobTitle,
              onChanged: (value) => setState(() => _selectedJobTitle = value),
            ),
            SizedBox(height: 5),
            _buildTextField(
              title: 'Years of Experience',
              hintText: 'e.g., Enter your years of experience',
              onChanged: (value) => _experience = double.tryParse(value),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String title,
    required String hintText,
    required ValueChanged<String> onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 5),
        TextFormField(
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
            hintText: hintText,
            hintStyle: TextStyle(
              fontSize: 14,
              color: Colors.grey.shade400,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w300,
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter a value';
            }
            if (double.tryParse(value) == null) {
              return 'Please enter a valid number';
            }
            return null;
          },
          onChanged: onChanged,
        ),
      ],
    );
  }

  Widget _buildSearchableDropdown({
    required String title,
    required List<String> items,
    required String? selectedItem,
    required String hint,
    required ValueChanged<String?> onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 5),
        DropdownSearch<String>(
          items: items,
          selectedItem: selectedItem,
          onChanged: onChanged,
          dropdownBuilder: (context, selectedItem) {
            return Text(
              selectedItem ?? hint,
              style: TextStyle(
                fontSize: 14,
                color: selectedItem == null ? Colors.grey.shade400 : Colors.black,
                fontStyle: selectedItem == null ? FontStyle.italic : FontStyle.normal,
                fontWeight: selectedItem == null ? FontWeight.w300 : FontWeight.normal,
              ),
            );
          },
          popupProps: PopupProps.menu(
            showSearchBox: true,
            searchFieldProps: TextFieldProps(
              decoration: InputDecoration(
                hintText: 'Search...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            menuProps: MenuProps(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          dropdownDecoratorProps: DropDownDecoratorProps(
            dropdownSearchDecoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.black54),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(color: Colors.blue.shade400),
              ),
              contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            ),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please select $title';
            }
            return null;
          },
        ),
      ],
    );
  }

  bool validateAndSubmit() {
    if (_formKey.currentState!.validate()) {
      context.read<SalaryProvider>().predictSalary(
        age: _age?.toInt() ?? 0,
        gender: _selectedGender!,
        degree: _selectedEducation!,
        jobTitle: _selectedJobTitle!,
        experience: _experience!,
      );
      return true;
    }
    return false;
  }
}
