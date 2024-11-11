import 'dart:core';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path/path.dart' as p;
import 'applied_program.dart';

class LanguageProficiencyForm extends StatefulWidget {
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
      currentYearOfStudy,
      academicYear,
      major,
      institutionName,
      schoolName,
      cityCountry,
      overallGrade,
      mathGrade,
      englishGrade,
      highSchoolName,
      provinceCountry;
  final File? idFile, certificateFile, highSchoolId;

  const LanguageProficiencyForm({
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
    required this.currentYearOfStudy,
    required this.academicYear,
    required this.major,
    required this.institutionName,
    required this.schoolName,
    required this.cityCountry,
    required this.overallGrade,
    required this.mathGrade,
    required this.englishGrade,
    required this.highSchoolName,
    required this.provinceCountry,
    required this.certificateFile,
    required this.highSchoolId,
  });

  @override
  _LanguageProficiencyFormState createState() =>
      _LanguageProficiencyFormState();
}

class _LanguageProficiencyFormState extends State<LanguageProficiencyForm> {
  String? ieltsOrToefl;
  File? ieltsOrToeflCertificate;

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'pdf'], // Allow only jpg and pdf files
    );

    if (result != null) {
      setState(() {
        ieltsOrToeflCertificate =
            File(result.files.single.path!); // Get the selected file
      });
    }
  }

  void _goToAppliedProgramForm() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AppliedProgramForm(
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
          highSchoolName: widget.highSchoolName,
          provinceCountry: widget.provinceCountry,
          highSchoolId: widget.highSchoolId,
          ieltsOrToefl: ieltsOrToefl ?? '',
          ieltsOrToeflCertificate: ieltsOrToeflCertificate,
        ),
      ),
    );
  }

  void _goBack() {
  Navigator.pop(context); // This will pop the current route and go back to the previous screen.
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Section 3.5: English Language Proficiency',
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
          // key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[


                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0), // Add padding to the text
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Do you have IELTS or TOEFL Certificate? (For non-native English speaker only)',
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

                
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0), // Padding for alignment
                  child: Card(
                    color: Colors.grey[200], // Background color of the checkbox container
                    child: Padding(
                      padding: const EdgeInsets.all(8), // Inner padding for the card
                      child: Column(
                        children: [
                          CheckboxListTile(
                            title: const Text('IELTS'),
                            value: ieltsOrToefl == 'IELTS',
                            onChanged: (bool? value) {
                              setState(() {
                                ieltsOrToefl = value! ? 'IELTS' : '';
                              });
                            },
                          ),
                          CheckboxListTile(
                            title: const Text('TOEFL'),
                            value: ieltsOrToefl == 'TOEFL',
                            onChanged: (bool? value) {
                              setState(() {
                                ieltsOrToefl = value! ? 'TOEFL' : '';
                              });
                            },
                            
                          ),
                          CheckboxListTile(
                            title: const Text('None'),
                            value: ieltsOrToefl == 'None',
                            onChanged: (bool? value) {
                              setState(() {
                                ieltsOrToefl = value! ? 'None' : '';
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

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
                              'IELTS or TOEFL Certificate (PDF/JPG)',
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
                                  ieltsOrToeflCertificate != null ? p.basename(ieltsOrToeflCertificate!.path) : 'No file selected',
                                  style: const TextStyle(fontSize: 16), // Optional: style for the filename
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: Colors.black, // Button text color
                                    backgroundColor: Colors.grey[300], // Button background color
                                  ),
                                  onPressed: _pickFile, // Function to pick the file
                                  child: const Text('Upload File'),
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
                          // Check if the form is valid
                          
                            // If IELTS or TOEFL is selected, file upload is mandatory
                            if (ieltsOrToefl == null || ieltsOrToefl!.isEmpty) {
                              // Show an error message if no option is selected
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Please select IELTS, TOEFL, or None.'),
                                  backgroundColor: Colors.red,
                                ),
                              );
                            } else if ((ieltsOrToefl == 'IELTS' || ieltsOrToefl == 'TOEFL') && ieltsOrToeflCertificate == null) {
                              // Show an error if no file is uploaded
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Please upload the IELTS or TOEFL certificate.'),
                                  backgroundColor: Colors.red,
                                ),
                              );
                            }
                            else if (ieltsOrToefl == 'None') {
                              _goToAppliedProgramForm();
                            } else {
                              _goToAppliedProgramForm();
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

