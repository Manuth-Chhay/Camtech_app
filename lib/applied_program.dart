import 'dart:io';

import 'package:flutter/src/material/drawer.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart'; // For formatting dates
import 'package:path/path.dart' as p; // For getting filename
import 'guardian_info_form.dart';

class AppliedProgramForm extends StatefulWidget {
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
      provinceCountry,
      ieltsOrToefl;
  final File? idFile, certificateFile, ieltsOrToeflCertificate, highSchoolId;

  const AppliedProgramForm({
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
    required this.certificateFile,
    required this.ieltsOrToefl,
    required this.ieltsOrToeflCertificate,
    required this.highSchoolName,
    required this.provinceCountry,
    required this.highSchoolId,
  });
  @override
  _AppliedProgramFormState createState() => _AppliedProgramFormState();
}

  // // Function to pick an image file
  // Future<void> _pickFile() async {
  //   FilePickerResult? result = await FilePicker.platform.pickFiles(
  //     type: FileType.custom,
  //     allowedExtensions: ['jpg', 'pdf', 'jpeg', 'png'], // Allow only jpg and pdf files
  //   );

  //   if (result != null) {
  //     setState(() {
  //       qr_img = File(result.files.single.path!); // Get the selected file
  //     });
  //   }
  // }


class _AppliedProgramFormState extends State<AppliedProgramForm> {
  final _formKey = GlobalKey<FormState>();
  String? interestedMajor;
  String? scholarship;
  String? requestedAcademicTerm;
  String? retryEntry;
  Set<String>? howDidYouHearAboutUs = {};
  bool? consent;
  bool? declaration;

  // Function to submit form data with file to the Django backend
  Future<void> submitForm() async {
    if (widget.idFile == null) {
      ScaffoldMessenger.of(context as BuildContext).showSnackBar(
        const SnackBar(content: Text('Please upload an ID file')),
      );
      return;
    }

    const prod_url = 'https://regene.pythonanywhere.com/api/submit-form/';
    const dev_url = 'http://192.168.3.135:8000/api/submit-form/';
    var request = http.MultipartRequest('POST', Uri.parse(prod_url));

    request.fields['nameEn'] = widget.nameEn;
    request.fields['nameKh'] = widget.nameKh;
    request.fields['nationality'] = widget.nationality;
    request.fields['gender'] = widget.gender;
    request.fields['dob'] = widget.dob;
    request.fields['pob'] = widget.pob;
    request.fields['address'] = widget.address;
    request.fields['country'] = widget.country;
    request.fields['phone'] = widget.phone;
    request.fields['email'] = widget.email;
    request.fields['guardianName'] = widget.guardianName;
    request.fields['guardianRelation'] = widget.relationship;
    request.fields['guardianNationality'] = widget.guardianNationality;
    request.fields['guardianAddress'] = widget.guardianAddress;
    request.fields['guardianJob'] = widget.jobPosition;
    request.fields['guardianPhone'] = widget.guardianPhone;
    request.fields['currentEducation'] = widget.currentYearOfStudy;
    request.fields['currentMajor'] = widget.major;
    request.fields['institutionName'] = widget.institutionName;
    request.fields['academicYear'] = widget.academicYear;
    request.fields['schoolName'] = widget.schoolName;
    request.fields['schoolAddress'] = widget.cityCountry;
    request.fields['overallGrade'] = widget.overallGrade;
    request.fields['mathGrade'] = widget.mathGrade;
    request.fields['englishGrade'] = widget.englishGrade;
    request.fields['highschoolName'] = widget.highSchoolName;
    request.fields['highschoolAddress'] = widget.provinceCountry;
    request.fields['IELTS'] = widget.ieltsOrToefl;
    request.fields['interestedMajor'] = interestedMajor!;
    request.fields['requestScholarship'] = scholarship!;
    request.fields['requestAcademicTerm'] = requestedAcademicTerm!;
    request.fields['retry'] = retryEntry!;
    request.fields['knowAboutUs'] = howDidYouHearAboutUs!.join(', ');
    request.fields['consent'] = consent?.toString() ?? 'false';
    request.fields['declaration'] = declaration?.toString() ?? 'false';

    if (widget.idFile != null) {
      request.files.add(
          await http.MultipartFile.fromPath('idFile', widget.idFile!.path));
    }
    if (widget.ieltsOrToeflCertificate != null) {
      request.files.add(await http.MultipartFile.fromPath(
          'IELTSCertificate', widget.ieltsOrToeflCertificate!.path));
    }
    if (widget.highSchoolId != null) {
      request.files.add(await http.MultipartFile.fromPath(
          'highschoolIdFile', widget.highSchoolId!.path));
    }

    if (widget.certificateFile != null) {
      request.files.add(await http.MultipartFile.fromPath(
          'highschoolCertificate', widget.certificateFile!.path));
    }

    try {
      final response = await request.send();
      if (response.statusCode == 201) {
        ScaffoldMessenger.of(context as BuildContext).showSnackBar(
          const SnackBar(content: Text('Form submitted successfully!')),
        );
      } else {
        ScaffoldMessenger.of(context as BuildContext).showSnackBar(
          const SnackBar(content: Text('Failed to submit the form.')),
        );
      }
    } catch (e) {
      print('Error submitting form: $e');
      ScaffoldMessenger.of(context as BuildContext).showSnackBar(
        const SnackBar(content: Text('Failed to submit the form.')),
      );
    }
  }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Section 4: Applied Program',
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


//Choose major
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0), // Add padding to the text
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Choose your interested Major',
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

              const SizedBox(height: 8), // Add some space between the text and the dropdown
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Card(
                  color: Colors.grey[200], // Grey background for the card
                  child: Padding(
                    padding: const EdgeInsets.all(4), // Increased padding for better spacing
                    child: DropdownButtonFormField<String>(
                      value: interestedMajor?.isNotEmpty == true ? interestedMajor : null, // Safely set the initial value
                      items: [
                        'Robotics and Automation Engineering',
                        'Data Science and Artificial Intelligence',
                        'Software Engineering',
                        'Cyber Security',
                        'Architecture',
                        'Interior Design',
                        'Educational Technology',
                        'Media and Communication Technology',
                        'Risk Management and Business Intelligence',
                        'Innovation and Entrepreneurship'
                      ].map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          interestedMajor = value; // Safe assignment without force unwrap
                        });
                      },
                      validator: (value) {
                        return value == null || value.isEmpty
                            ? 'Please select your interested major'
                            : null; // Validator for empty selection
                      },
                      decoration: const InputDecoration(
                        border: InputBorder.none, // Remove the underline
                        contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 8), // Padding inside the dropdown
                      ),
                    ),
                  ),
                ),
              ),


//Scholarship
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
                          "Are you applying for a scholarship?",
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
                  const SizedBox(height: 8), // Add some space between the text and the dropdown
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0), // Horizontal padding for the card
                    child: Card(
                      color: Colors.grey[200], // Card background color
                      child: Padding(
                        padding: const EdgeInsets.all(4), // Padding inside the card
                        child: DropdownButtonFormField<String>(
                          value: scholarship?.isNotEmpty == true ? scholarship : null, // Safely set the initial value
                          items: ['Yes', 'No'].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              scholarship = value; // Update the selected scholarship option
                            });
                          },
                          validator: (value) {
                            return value == null || value.isEmpty
                                ? 'Please choose one'
                                : null; // Validator for empty selection
                          },
                          decoration: const InputDecoration(
                            border: InputBorder.none, // Remove the underline
                            contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 8), // Padding inside the dropdown
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
               

//Academix Year
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
                          "Choose one Academic Term",
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

                const SizedBox(height: 8), // Add some space between the text and the dropdown
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Card(
                    color: Colors.grey[200], // Grey background for the card
                    child: Padding(
                      padding: const EdgeInsets.all(4), // Increased padding for better spacing
                      child: DropdownButtonFormField<String>(
                        value: requestedAcademicTerm?.isNotEmpty == true ? requestedAcademicTerm : null, // Safely set the initial value
                        items: [
                          'Term I',
                          'Term II',
                          'Term III'
                        ].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            requestedAcademicTerm = value; // Safe assignment without force unwrap
                          });
                        },
                        validator: (value) {
                          return value == null || value.isEmpty
                              ? 'Please choose one'
                              : null; // Validator for empty selection
                        },
                        decoration: const InputDecoration(
                          border: InputBorder.none, // Remove the underline
                          contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 8), // Padding inside the dropdown
                        ),
                      ),
                    ),
                  ),
                ),


//Request entry
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
                          "If you are not successful in this requested entry intake, \n "
                          "would you like to be considered for the next intake?",
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
                  const SizedBox(height: 8), // Add some space between the text and the dropdown
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0), // Horizontal padding for the card
                    child: Card(
                      color: Colors.grey[200], // Card background color
                      child: Padding(
                        padding: const EdgeInsets.all(4), // Padding inside the card
                        child: DropdownButtonFormField<String>(
                          value: retryEntry?.isNotEmpty == true ? retryEntry : null, // Safely set the initial value
                          items: ['Yes', 'No'].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (value) {
                            setState(() {
                              retryEntry = value; // Update the selected scholarship option
                            });
                          },
                          validator: (value) {
                            return value == null || value.isEmpty
                                ? 'Please choose one'
                                : null; // Validator for empty selection
                          },
                          decoration: const InputDecoration(
                            border: InputBorder.none, // Remove the underline
                            contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 8), // Padding inside the dropdown
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),


//How do you know Camtech?
              const SizedBox(height: 8),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start, // Align all child widgets to the left
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0), // Horizontal padding for the label
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "How do you know about Camtech?",
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
                ]
              ),
                const SizedBox(height: 8), // Add space between text and the checkboxes
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0), // Padding for alignment
                  child: Card(
                    color: Colors.grey[200], // Background color of the checkbox container
                    child: Padding(
                      padding: const EdgeInsets.all(2), // Inner padding for the card
                      child: Column(
                        children: [

                          CheckboxListTile(
                            title: const Text('TV Advertisement'),
                            value: howDidYouHearAboutUs?.contains('TV Advertisement'),
                            onChanged: (bool? value) {
                              setState(() {
                                if (value!) {
                                howDidYouHearAboutUs?.add('TV Advertisement');
                              } else {
                                howDidYouHearAboutUs?.remove('TV Advertisement');
                              }
                              });
                            },
                          ),
                            

                          CheckboxListTile(
                            title: const Text('Radio Advertisement'),
                            value: howDidYouHearAboutUs?.contains('Radio Advertisement'),
                            onChanged: (bool? value) {
                              setState(() {
                                if (value!) {
                                howDidYouHearAboutUs?.add('Radio Advertisement');
                              } else {
                                howDidYouHearAboutUs?.remove('Radio Advertisement');
                              }
                              });
                            },
                          ),

                          CheckboxListTile(
                            title: const Text('Newspapers/ Social Media News'),
                            value: howDidYouHearAboutUs?.contains('Newspapers/ Social Media News'),
                            onChanged: (bool? value) {
                              setState(() {
                                if (value!) {
                                howDidYouHearAboutUs?.add('Newspapers/ Social Media News');
                              } else {
                                howDidYouHearAboutUs?.remove('Newspapers/ Social Media News');
                              }
                              });
                            },
                          ),

                          CheckboxListTile(
                            title: const Text('CamTech Website'),
                            value: howDidYouHearAboutUs?.contains('CamTech Website'),
                            onChanged: (bool? value) {
                              setState(() {
                                if (value!) {
                                howDidYouHearAboutUs?.add('CamTech Website');
                              } else {
                                howDidYouHearAboutUs?.remove('CamTech Website');
                              }
                              });
                            },
                          ),

                          CheckboxListTile(
                            title: const Text('CamTech Youtube Channel'),
                            value: howDidYouHearAboutUs?.contains('CamTech Youtube Channel'),
                            onChanged: (bool? value) {
                              setState(() {
                                if (value!) {
                                howDidYouHearAboutUs?.add('CamTech Youtube Channel');
                              } else {
                                howDidYouHearAboutUs?.remove('CamTech Youtube Channel');
                              }
                              });
                            },
                          ),

                          CheckboxListTile(
                            title: const Text('Camtech Tik Tok'),
                            value: howDidYouHearAboutUs?.contains('Camtech Tik Tok'),
                            onChanged: (bool? value) {
                              setState(() {
                                if (value!) {
                                howDidYouHearAboutUs?.add('Camtech Tik Tok');
                              } else {
                                howDidYouHearAboutUs?.remove('Camtech Tik Tok');
                              }
                              });
                            },
                          ),

                          CheckboxListTile(
                            title: const Text('Camtech Facebook Page'),
                            value: howDidYouHearAboutUs?.contains('Camtech Facebook Page'),
                            onChanged: (bool? value) {
                              setState(() {
                                if (value!) {
                                howDidYouHearAboutUs?.add('Camtech Facebook Page');
                              } else {
                                howDidYouHearAboutUs?.remove('Camtech Facebook Page');
                              }
                              });
                            },
                          ),

                          CheckboxListTile(
                            title: const Text('Friend/Relatives'),
                            value: howDidYouHearAboutUs?.contains('Friend/Relatives'),
                            onChanged: (bool? value) {
                              setState(() {
                                if (value!) {
                                howDidYouHearAboutUs?.add('Friend/Relatives');
                              } else {
                                howDidYouHearAboutUs?.remove('Friend/Relatives');
                              }
                              });
                            },
                          ),

                          CheckboxListTile(
                            title: const Text('School/Workplace connection with Camtech'),
                            value: howDidYouHearAboutUs?.contains('School/Workplace connection with Camtech'),
                            onChanged: (bool? value) {
                              setState(() {
                                if (value!) {
                                howDidYouHearAboutUs?.add('School/Workplace connection with Camtech');
                              } else {
                                howDidYouHearAboutUs?.remove('School/Workplace connection with Camtech');
                              }
                              });
                            },
                          ),

                          CheckboxListTile(
                            title: const Text('Participation in Camtech Event(s)'),
                            value: howDidYouHearAboutUs?.contains('Participation in Camtech Event(s)'),
                            onChanged: (bool? value) {
                              setState(() {
                                if (value!) {
                                howDidYouHearAboutUs?.add('Participation in Camtech Event(s)');
                              } else {
                                howDidYouHearAboutUs?.remove('Participation in Camtech Event(s)');
                              }
                              });
                            },
                          ),

                          CheckboxListTile(
                            title: const Text('Other Social Event'),
                            value: howDidYouHearAboutUs?.contains('Other Social Event'),
                            onChanged: (bool? value) {
                              setState(() {
                                if (value!) {
                                howDidYouHearAboutUs?.add('Other Social Event');
                              } else {
                                howDidYouHearAboutUs?.remove('Other Social Event');
                              }
                              });
                            },
                          ),

                        ]
                      )
                    )
                  )
                ),
                

//Consent
              const Padding(padding: EdgeInsets.only(bottom: 10)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    const Text('CamTech University will use your e-mail for being in touch with you and inform you about our events \n''and activities. You have the right to withdraw your consent at any time.', 
                    style: TextStyle(fontSize: 13, color: Color(0xFF003665), fontWeight: FontWeight.w600)), 
                    Switch(
                      value: consent ?? false,
                      onChanged: (bool newValue) {
                        setState(() {
                          consent = newValue;
                        });
                      },
                    ),
                  ],
                ),

//Declaration
const Padding(padding: EdgeInsets.only(bottom: 10)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    const Text('I declare that all information provided is correct and understand that false, inaccurate or misleading \n''information will result in the students\' withdrawal from school.', 
                    style: TextStyle(fontSize: 13, color: Color(0xFF003665), fontWeight: FontWeight.w600)), 
                    Switch(
                      value: declaration ?? false,
                      onChanged: (bool newValue) {
                        setState(() {
                          declaration = newValue;
                        });
                      },
                    ),
                  ],
                ),


//QR Code
                const Padding(padding: EdgeInsets.only(bottom: 20)),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text("Application Fee \$10 \n" "Canadia Bank QR Code \n" "Bank Account Name: CAMTECH\n""Bank Account Number: 0010005300407" , 
                    style: TextStyle(fontSize: 13, color: Color(0xFF003665), fontWeight: FontWeight.w600)), 
                  ],
                ),

                const SizedBox(height: 20), // Add some space between the text and the image
                Center(
                  child: Image.asset(
                    'camtech_app/assets/logo/logo.png', // Path to your QR code image
                    width: 150, // Set the width of the image
                    height: 150, // Set the height of the image
                    fit: BoxFit.cover, // Adjust the image fit
                  ),
                ),



                  // const SizedBox(height: 8),
                  // Column(
                  //   crossAxisAlignment: CrossAxisAlignment.start, // Align all child widgets to the left
                  //   children: [
                  //     const Padding(
                  //       padding: EdgeInsets.symmetric(horizontal: 16.0), // Horizontal padding for the label
                  //       child: Row(
                  //         crossAxisAlignment: CrossAxisAlignment.center,
                  //         children: [
                  //           Text(
                  //             'Recipt of the Payment (PDF/JPG)',
                  //             style: TextStyle(
                  //               fontSize: 17,
                  //               color: Color(0xFF003665), // Use the specified color
                  //               fontWeight: FontWeight.w600, // Semi-bold
                  //             ),
                  //           ),
                  //           Text(
                  //             '*', // Asterisk to indicate importance
                  //             style: TextStyle(
                  //               color: Colors.red,
                  //               fontSize: 17,
                  //             ),
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //     const SizedBox(height: 8), // Space between the label and the card
                  //     Padding(
                  //       padding: const EdgeInsets.symmetric(horizontal: 8.0), // Horizontal padding for the card
                  //       child: Card(
                  //         color: Colors.grey[200], // Card background color
                  //         child: Padding(
                  //           padding: const EdgeInsets.all(8), // Padding inside the card
                  //           child: Row(
                  //             mainAxisAlignment: MainAxisAlignment.spaceBetween, // Space between text and button
                  //             children: <Widget>[
                  //               Text(
                  //                 qr_img != null ? p.basename(idFile!.path) : 'No file selected',
                  //                 style: const TextStyle(fontSize: 16), // Optional: style for the filename
                  //               ),
                  //               ElevatedButton(
                  //                 style: ElevatedButton.styleFrom(
                  //                   foregroundColor: Colors.black, // Button text color
                  //                   backgroundColor: Colors.grey[300], // Button background color
                  //                 ),
                  //                 onPressed: _pickFile, // Function to pick the file
                  //                 child: const Text('Upload recipt'),
                  //               ),
                  //             ],
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),




//submit button
                const Padding(padding: EdgeInsets.only(bottom: 60)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          submitForm();
                        }
                      },
                      child: const Text('Submit'),
                      ),
                    ],
                  ),
                ]),
              ],
            ),
          )
        )
      )
    );
  }
}