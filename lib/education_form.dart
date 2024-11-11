import 'package:flutter/material.dart';
import 'dart:io';
import 'highschool_form.dart';
import 'highschool_graduate_form.dart';
import 'university_form.dart';

class EducationForm extends StatefulWidget {
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

  const EducationForm({
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
  _EducationFormState createState() => _EducationFormState();
}

class _EducationFormState extends State<EducationForm> {
  final _formKey = GlobalKey<FormState>();
  String education = '';

  void _goToHighSchoolForm() {
    if (_formKey.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HighSchoolForm(
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
            currentYearOfStudy: '',
            academicYear: '',
            major: '',
            institutionName: '',
            schoolName: '',
            cityCountry: '',
            overallGrade: '',
            mathGrade: '',
            englishGrade: '',
            certificateFile: null,
          ),
        ),
      );
    }
  }

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
            major: '',
            institutionName: '',
            currentYearOfStudy: '',
          ),
        ),
      );
    }
  }

  void _goToUniversityForm() {
    if (_formKey.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => UniversityForm(
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
          ),
        ),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Section 3: Educational Background',
          style: TextStyle(
            color: Colors.white, // Customize the title text color
            fontWeight: FontWeight.bold, // Make the text bold
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


                // Education Question
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0), // Add padding to the text
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'What is your current education?',
                        style: TextStyle(
                          color: Color(0xFF003665), // Customize the text color
                          fontSize: 17,
                          fontWeight: FontWeight.w600, // Semi-bold text
                        ),
                      ),
                      Text(
                        '*',
                        style: TextStyle(color: Colors.red, fontSize: 17), // Red asterisk for required field
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8), // Add space between text and the checkboxes

                // Education Checkboxes
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0), // Padding for alignment
                  child: Card(
                    color: Colors.grey[200], // Background color of the checkbox container
                    child: Padding(
                      padding: const EdgeInsets.all(8), // Inner padding for the card
                      child: Column(
                        children: [
                          CheckboxListTile(
                            title: const Text('University'),
                            value: education == 'University',
                            onChanged: (bool? value) {
                              setState(() {
                                education = value! ? 'University' : '';
                              });
                            },
                          ),
                          CheckboxListTile(
                            title: const Text('High School Graduate'),
                            value: education == 'High School Graduate',
                            onChanged: (bool? value) {
                              setState(() {
                                education = value! ? 'High School Graduate' : '';
                              });
                            },
                          ),
                          CheckboxListTile(
                            title: const Text('12th Grader'),
                            value: education == '12th Grader',
                            onChanged: (bool? value) {
                              setState(() {
                                education = value! ? '12th Grader' : '';
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                // Spacing between checkboxes and button
                const SizedBox(height: 20),

                // Next Button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0), // Padding for alignment
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        if (education == 'University') {
                          _goToUniversityForm();
                        } else if (education == 'High School Graduate') {
                          _goToHighSchoolGraduateForm();
                        } else if (education == '12th Grader') {
                          _goToHighSchoolForm();
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF003665), // Button background color
                      padding: const EdgeInsets.all(16),
                      // minimumSize: const Size(10, 50),  // Padding inside the button
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8), // Rounded corners
                      ),
                    ),
                    child: const Text(
                      'Next',
                      style: TextStyle(color: Colors.white), // Button text color
                    ),
                  ),
                ),
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}