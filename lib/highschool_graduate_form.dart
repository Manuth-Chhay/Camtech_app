import 'dart:io';

import 'package:camtech_app/language_proficiency.dart';
import 'package:path/path.dart' as p;
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'highschool_form.dart';

class HighSchoolGraduateForm extends StatefulWidget {
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
      guardianPhone,
      major,
      institutionName,
      currentYearOfStudy;
  final File? idFile;

  const HighSchoolGraduateForm({
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
    required this.major,
    required this.institutionName,
    required this.currentYearOfStudy,
  });
  @override
  _HighSchoolGraduateFormState createState() => _HighSchoolGraduateFormState();
}

class _HighSchoolGraduateFormState extends State<HighSchoolGraduateForm> {
  final _formKey = GlobalKey<FormState>();
  String academicYear = '';
  String schoolName = '';
  String cityCountry = '';
  String overallGrade = '';
  String mathGrade = '';
  String englishGrade = '';
  File? certificateFile;

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'pdf', 'jpeg', 'png'], // Allow only jpg and pdf files
    );

    if (result != null) {
      setState(() {
        certificateFile = File(result.files.single.path!); // Get the selected file
      });
    }
  }

  void _goToLanguageProficiencyForm() {
    if (_formKey.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LanguageProficiencyForm(
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
            academicYear: '',
            schoolName: '',
            cityCountry: '',
            overallGrade: '',
            mathGrade: '',
            englishGrade: '',
            certificateFile: null,
            highSchoolName: '',
            provinceCountry: '',
            highSchoolId: null,
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
        'Section 3.2: Highschool Graduate Form',
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


// Graduation Year
              Column(
                crossAxisAlignment: CrossAxisAlignment.start, // Aligns to the left
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0), // Same padding as the card
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Academic Year(Graduation)',
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
                              academicYear = value;
                            });
                          },
                          validator: (value) {
                            return value!.isEmpty ? 'Please enter your graduation year' : null;
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


//High School Name
                const SizedBox(height: 8),
                Column(
                crossAxisAlignment: CrossAxisAlignment.start, // Aligns to the left
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0), // Same padding as the card
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Highschool Name',
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
                              schoolName= value;
                            });
                          },
                          validator: (value) {
                            return value!.isEmpty ? 'Please enter your highschool name' : null;
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


//City/Province/Country of school
                const SizedBox(height: 8),
                Column(
                crossAxisAlignment: CrossAxisAlignment.start, // Aligns to the left
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0), // Same padding as the card
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'City/Province/Country of School',
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
                              cityCountry= value;
                            });
                          },
                          validator: (value) {
                            return value!.isEmpty ? 'Please enter where your highschool is' : null;
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



//Overall Grade
                  const SizedBox(height: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Overall Grade",
                              style: TextStyle(
                                fontSize: 17,
                                color: Color(0xFF003665),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              '*',
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 17,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8), // Add some space between the text and the dropdown
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Card(
                          color: Colors.grey[200],
                          child: Padding(
                            padding: const EdgeInsets.all(2),
                            child: DropdownButtonFormField<String>(
                              value: overallGrade.isNotEmpty ? overallGrade : null, // Set the initial value
                              items: ['A', 'B', 'C', 'D', 'E'].map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  overallGrade= value!; // Update the selected gender
                                });
                              },
                              validator: (value) {
                                return value == null || value.isEmpty
                                    ? 'Please select your overall grade'
                                    : null; // Validator for empty selection
                              },
                              decoration: const InputDecoration( // Grey background for the dropdown
                                border: InputBorder.none, // Remove the underline
                                contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 8), // Padding inside the dropdown
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),


//Math Grade
                  const SizedBox(height: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Math Grade",
                              style: TextStyle(
                                fontSize: 17,
                                color: Color(0xFF003665),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              '*',
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 17,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8), // Add some space between the text and the dropdown
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Card(
                          color: Colors.grey[200],
                          child: Padding(
                            padding: const EdgeInsets.all(2),
                            child: DropdownButtonFormField<String>(
                              value: mathGrade.isNotEmpty ? mathGrade : null, // Set the initial value
                              items: ['A', 'B', 'C', 'D', 'E'].map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  mathGrade= value!; // Update the selected gender
                                });
                              },
                              validator: (value) {
                                return value == null || value.isEmpty
                                    ? 'Please select your math grade'
                                    : null; // Validator for empty selection
                              },
                              decoration: const InputDecoration( // Grey background for the dropdown
                                border: InputBorder.none, // Remove the underline
                                contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 8), // Padding inside the dropdown
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),


//English Grade
                  const SizedBox(height: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "English Grade",
                              style: TextStyle(
                                fontSize: 17,
                                color: Color(0xFF003665),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              '*',
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 17,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8), // Add some space between the text and the dropdown
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Card(
                          color: Colors.grey[200],
                          child: Padding(
                            padding: const EdgeInsets.all(2),
                            child: DropdownButtonFormField<String>(
                              value: englishGrade.isNotEmpty ? englishGrade : null, // Set the initial value
                              items: ['A', 'B', 'C', 'D', 'E'].map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  englishGrade= value!; // Update the selected gender
                                });
                              },
                              validator: (value) {
                                return value == null || value.isEmpty
                                    ? 'Please select your english grade'
                                    : null; // Validator for empty selection
                              },
                              decoration: const InputDecoration( // Grey background for the dropdown
                                border: InputBorder.none, // Remove the underline
                                contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 8), // Padding inside the dropdown
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),


//Certificate
                  const SizedBox(height: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start, // Align all child widgets to the left
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0), // Horizontal padding for the label
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Highschool Certificate or any Equivalent document (PDF/JPG)',
                              style: TextStyle(
                                fontSize: 17,
                                color: Color(0xFF003665), // Use the specified color
                                fontWeight: FontWeight.w600, // Semi-bold
                              ),
                            ),
                            Text(
                              '*', // Asterisk to indicate importance
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 17,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8), // Space between the label and the card
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0), // Horizontal padding for the card
                        child: Card(
                          color: Colors.grey[200], // Card background color
                          child: Padding(
                            padding: const EdgeInsets.all(8), // Padding inside the card
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween, // Space between text and button
                              children: <Widget>[
                                Text(
                                  certificateFile != null ? p.basename(certificateFile!.path) : 'No file selected',
                                  style: const TextStyle(fontSize: 16), // Optional: style for the filename
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: Colors.black, // Button text color
                                    backgroundColor: Colors.grey[300], // Button background color
                                  ),
                                  onPressed: _pickFile, // Function to pick the file
                                  child: const Text('Upload ID File'),
                                ),
                              ],
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
                      padding: const EdgeInsets.only(left: 12.0), // Add spacing between buttons
                      child: ElevatedButton(
                        onPressed: () {
                          // Check if the form is valid and if the file has been uploaded
                            if (certificateFile == null) {
                              // Show an error if no file is uploaded
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Please upload your highschool certificate/document.'),
                                  backgroundColor: Colors.red,
                                ),
                              );
                            } else {
                              // Proceed to the next form if a file is uploaded
                              _goToLanguageProficiencyForm();
                            }
                          
                        },
                        child: const Text('Next'),
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white, // Set background color to blue
                          backgroundColor: Color(0xFF003665), // Set text color to white
                          padding: const EdgeInsets.all(16), // Set the size (width, height)
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8), // Set rounded corners
                          ),
                        ),
                      ),
                    ),

                  ],
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }
}
