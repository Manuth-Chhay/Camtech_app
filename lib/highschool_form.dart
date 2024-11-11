import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'language_proficiency.dart';
import 'package:path/path.dart' as p;

class HighSchoolForm extends StatefulWidget {
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

  const HighSchoolForm({
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
    required String currentYearOfStudy,
    required String academicYear,
    required String major,
    required String institutionName,
    required String schoolName,
    required String cityCountry,
    required String overallGrade,
    required String mathGrade,
    required String englishGrade,
    File? certificateFile,
  });
  @override
  _HighSchoolFormState createState() => _HighSchoolFormState();
}

class _HighSchoolFormState extends State<HighSchoolForm> {
  final _formKey = GlobalKey<FormState>();
  String? highSchoolName;
  String? provinceCountry;
  File? highSchoolId;

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'pdf'], // Allow only jpg and pdf files
    );

    if (result != null) {
      setState(() {
        highSchoolId = File(result.files.single.path!); // Get the selected file
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
            highSchoolName: highSchoolName ?? '',
            provinceCountry: provinceCountry ?? '',
            highSchoolId: highSchoolId,
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
        'Section 3.3: Highschool Form',
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


// Current Highschool Name
              Column(
                crossAxisAlignment: CrossAxisAlignment.start, // Aligns to the left
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0), // Same padding as the card
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Current Highschool Name',
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
                              highSchoolName = value;
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


// Current Highschool Province/City
              Column(
                crossAxisAlignment: CrossAxisAlignment.start, // Aligns to the left
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0), // Same padding as the card
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Province/City/Country',
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
                              provinceCountry = value;
                            });
                          },
                          validator: (value) {
                            return value!.isEmpty ? 'Please enter where your highschool from' : null;
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


//Highschool ID
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
                              'Highschool ID Card (PDF/JPG)',
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
                                  highSchoolId != null ? p.basename(highSchoolId!.path) : 'No file selected',
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
                            if (highSchoolId == null) {
                              // Show an error if no file is uploaded
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Please upload your highschool ID.'),
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
                )

            ],
          ),
        ),
      ),
    ),
  );
}
}