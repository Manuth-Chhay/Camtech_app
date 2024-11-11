import 'package:flutter/material.dart';
import 'dart:io';
import 'highschool_graduate_form.dart';

class UniversityForm extends StatefulWidget {
  final String nameEn,
      nameKh,
      nationality,
      gender,
      dob,
      pob,
      address,
      country,
      phone,
      email,
      guardianName,
      relationship,
      guardianNationality,
      guardianAddress,
      jobPosition,
      guardianPhone;
  final File? idFile;

  const UniversityForm({
    required this.nameEn,
    required this.nameKh,
    required this.nationality,
    required this.gender,
    required this.dob,
    required this.pob,
    required this.address,
    required this.country,
    required this.phone,
    required this.email,
    required this.idFile,
    required this.guardianName,
    required this.relationship,
    required this.guardianNationality,
    required this.guardianAddress,
    required this.jobPosition,
    required this.guardianPhone,
  });

  @override
  _UniversityFormState createState() => _UniversityFormState();
}

class _UniversityFormState extends State<UniversityForm> {
  final _formKey = GlobalKey<FormState>();
  String major = '';
  String institutionName = '';
  String currentYearOfStudy = '';

  void _goToHighSchoolGraduateForm() {
    if (_formKey.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HighSchoolGraduateForm(
            nameEn: widget.nameEn,
            nameKh: widget.nameKh,
            nationality: widget.nationality,
            gender: widget.gender,
            dob: widget.dob,
            pob: widget.pob,
            address: widget.address,
            country: widget.country,
            phone: widget.phone,
            email: widget.email,
            idFile: widget.idFile,
            guardianName: widget.guardianName,
            relationship: widget.relationship,
            guardianNationality: widget.guardianNationality,
            guardianAddress: widget.guardianAddress,
            jobPosition: widget.jobPosition,
            guardianPhone: widget.guardianPhone,
            major: major,
            institutionName: institutionName,
            currentYearOfStudy: currentYearOfStudy,
          ),
        ),
      );
    }
  }

  void _goBack() {
  Navigator.pop(context); // This will pop the current route and go back to the previous screen.
}

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text(
        'Section 3.1: University Form',
        style: TextStyle(
          color: Colors.white, // Customize the title text color
          fontWeight: FontWeight.bold, // Make the text bold (optional)
        ),
      ),
      backgroundColor: const Color(0xFF003665), // Customize the AppBar background color
    ),
    body: Container(
      color: Colors.white,
      padding: const EdgeInsets.all(4.0),
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[


// Current Major
              Column(
                crossAxisAlignment: CrossAxisAlignment.start, // Aligns to the left
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0), // Same padding as the card
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Current Major',
                          style: TextStyle(color: Color(0xFF003665), fontSize: 17, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          '*',
                          style: TextStyle(color: Colors.red, fontSize: 17), // Red asterisk
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8), // Add some space between the text and the card
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0), // Padding to align with the text
                    child: Card(
                      color: Colors.grey[200], // Background color for the text input
                      child: Padding(
                        padding: const EdgeInsets.all(2),
                        child: TextFormField(
                          onChanged: (value) {
                            setState(() {
                              major = value;
                            });
                          },
                          validator: (value) {
                            return value!.isEmpty ? 'Please enter your major' : null;
                          },
                          decoration: const InputDecoration(
                            border: InputBorder.none, // Remove the underline
                            contentPadding: EdgeInsets.all(10), // Add padding inside the text field
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),


//Institution Name
              const SizedBox(height: 8), // Add space between sections
              Column(
                crossAxisAlignment: CrossAxisAlignment.start, // Aligns to the left
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Institution Name',
                          style: TextStyle(color: Color(0xFF003665), fontSize: 17, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          '*',
                          style: TextStyle(color: Colors.red, fontSize: 17),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Card(
                      color: Colors.grey[200],
                      child: Padding(
                        padding: const EdgeInsets.all(2),
                        child: TextFormField(
                          onChanged: (value) {
                            setState(() {
                              institutionName = value;
                            });
                          },
                          validator: (value) {
                            return value!.isEmpty ? 'Please enter your institution name' : null;
                          },
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(10),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),


//Current Year of Study
              const SizedBox(height: 8), // Add space between sections
              Column(
                crossAxisAlignment: CrossAxisAlignment.start, // Aligns to the left
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Current Year of Study',
                          style: TextStyle(color: Color(0xFF003665), fontSize: 17, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          '*',
                          style: TextStyle(color: Colors.red, fontSize: 17),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Card(
                      color: Colors.grey[200],
                      child: Padding(
                        padding: const EdgeInsets.all(2),
                        child: TextFormField(
                          onChanged: (value) {
                            setState(() {
                              currentYearOfStudy = value;
                            });
                          },
                          validator: (value) {
                            return value!.isEmpty ? 'Please enter your current year of study' : null;
                          },
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(10),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

//Button
                const SizedBox(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start, // Align buttons to the left
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0), // Add padding to the right of 'Back' button
                      child: ElevatedButton(
                        onPressed: _goBack,
                        child: const Text('Back'),
                        style: ElevatedButton.styleFrom(
                          foregroundColor: const Color.fromRGBO(255, 255, 255, 1), // Set background color to blue
                          backgroundColor: Color(0xFF003665), // Set text color to white
                          // minimumSize: const Size(5, 30), // Set the size (width, height)
                          padding: const EdgeInsets.all(16), // Add padding inside the button
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8), // Set rounded corners
                          ),
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left:12.0), // Add spacing between buttons
                      child: ElevatedButton(
                        onPressed: _goToHighSchoolGraduateForm,
                        child: const Text('Next'),
                        style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white, // Set background color to blue
                          backgroundColor: Color(0xFF003665), // Set text color to white
                          // minimumSize: const Size(10, 50), 
                          padding: const EdgeInsets.all(16),// Set the size (width, height)
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8), // Set rounded corners
                          ),
                        ),
                      ),
                    ),
                  ],
                )

            ],
          ),
        ),
      ),
    ),
  );
}
}