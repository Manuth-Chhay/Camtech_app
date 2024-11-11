import 'dart:io';

import 'package:flutter/material.dart';
import 'education_form.dart';

class ParentGuardianForm extends StatefulWidget {
  final String nameEn,
      nameKh,
      nationality,
      gender,
      dob,
      pob,
      address,
      country,
      phone,
      email;
  final File? idFile;

  const ParentGuardianForm({
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
  });

  @override
  _ParentGuardianFormState createState() => _ParentGuardianFormState();
}

class _ParentGuardianFormState extends State<ParentGuardianForm> {
  final _formKey = GlobalKey<FormState>();
  String guardianName = '';
  String relationship = '';
  String guardianNationality = '';
  String guardianAddress = '';
  String jobPosition = '';
  String guardianPhone = '';

  void _goToEducationForm() {
    if (_formKey.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => EducationForm(
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
            guardianName: guardianName,
            relationship: relationship,
            guardianNationality: guardianNationality,
            guardianAddress: guardianAddress,
            jobPosition: jobPosition,
            guardianPhone: guardianPhone,
          ),
        ),
      );
    }
  }

  void _goBack() {
  Navigator.pop(context); // This will pop the current route and go back to the previous screen.
}


  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: const Text("Parent/Guardian's Information"),
  //     ),
  //       backgroundColor: Colors.white,
  //     body: Padding(
  //       padding: const EdgeInsets.all(4.0),
  //       child: Form(
  //         key: _formKey,
  //         child: SingleChildScrollView(
  //           child: Column(
  //             children: <Widget>[

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Section 2: Guardian Information',
            style: TextStyle(
              color: Colors.white, // Customize the title text color
              fontWeight: FontWeight.bold, // Make the text bold (optional)
            ),
          ),
          backgroundColor: const Color(0xFF003665), // Customize the AppBar background color
          // iconTheme: const IconThemeData(color: Colors.blue), // Customize back icon color (optional)
        ),
        body: Container(
          color: Colors.white,
          padding: const EdgeInsets.all(4.0),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
 
//Guardian's Name                
                  const SizedBox(height: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start, // Aligns the entire column to the left
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0), // Same padding as the card
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center, // Align text and asterisk vertically with the card
                          children: [
                            Text(
                              "Parent/Guardian's Full Name",
                              style: TextStyle(color:Color(0xFF003665), fontSize: 17, fontWeight: FontWeight.w600),
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
                          color: Colors.grey[200], // Set the background color to white
                          child: Padding(
                            padding: const EdgeInsets.all(2),
                            child: TextFormField(
                              onChanged: (value) {
                                setState(() {
                                  guardianName = value;
                                });
                              },
                              validator: (value) {
                                return value!.isEmpty
                                    ? "Please enter your guardian's full name"
                                    : null;
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
                
                
                // const Align(
                //   alignment: Alignment.centerLeft,
                //   child: Text("Parent/Guardian's Name",
                //       style: TextStyle(fontSize: 17)),
                // ),
                // TextFormField(
                //   onChanged: (value) {
                //     setState(() {
                //       guardianName = value;
                //     });
                //   },
                //   validator: (value) {
                //     return value!.isEmpty
                //         ? 'Please enter the guardian\'s name'
                //         : null;
                //   },
                // ),


//Guardian's Nationality
                  const SizedBox(height: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start, // Aligns the entire column to the left
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0), // Same padding as the card
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center, // Align text and asterisk vertically with the card
                          children: [
                            Text(
                              "Nationality",
                              style: TextStyle(color:Color(0xFF003665), fontSize: 17, fontWeight: FontWeight.w600),
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
                          color: Colors.grey[200], // Set the background color to white
                          child: Padding(
                            padding: const EdgeInsets.all(2),
                            child: TextFormField(
                              onChanged: (value) {
                                setState(() {
                                  guardianNationality= value;
                                });
                              },
                              validator: (value) {
                                return value!.isEmpty
                                    ? "Please enter your guardian's nationality"
                                    : null;
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


//Guardian's Relationship
                // const Padding(padding: EdgeInsets.only(bottom: 40)),
                // const Align(
                //   alignment: Alignment.centerLeft,
                //   child: Text('Relationship to you',
                //       style: TextStyle(fontSize: 17)),
                // ),
                // DropdownButtonFormField<String>(
                //   value: relationship.isNotEmpty ? relationship : null,
                //   items: ['Father', 'Mother', 'Sister', 'Brother', 'Other']
                //       .map((String value) {
                //     return DropdownMenuItem<String>(
                //       value: value,
                //       child: Text(value),
                //     );
                //   }).toList(),
                //   onChanged: (value) {
                //     setState(() {
                //       relationship = value!;
                //     });
                //   },
                //   validator: (value) {
                //     return value == null || value.isEmpty
                //         ? 'Please select the relationship'
                //         : null;
                //   },
                // ),
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
                              "Guardian's Relation to you",
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
                      const SizedBox(height: 8), // Add some space between the text and the card
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0), // Padding to align with the text
                        child: Card(
                          color: Colors.grey[200], // Set the background color to white
                          child: Padding(
                            padding: const EdgeInsets.all(2),
                            child: TextFormField(
                              onChanged: (value) {
                                setState(() {
                                  relationship= value;
                                });
                              },
                              validator: (value) {
                                return value == null || value.isEmpty
                                    ? "Please select your guardian's relationship to you"
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


                // const Padding(padding: EdgeInsets.only(bottom: 40)),
                // const Align(
                //     alignment: Alignment.centerLeft,
                //     child: Text("Nationality", style: TextStyle(fontSize: 17))),
                // TextFormField(
                //   onChanged: (value) {
                //     setState(() {
                //       guardianNationality = value;
                //     });
                //   },
                //   validator: (value) {
                //     return value!.isEmpty
                //         ? 'Please enter your nationality'
                //         : null;
                //   },
                // ),


//Guardian's Address
                  const SizedBox(height: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start, // Aligns the entire column to the left
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0), // Same padding as the card
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center, // Align text and asterisk vertically with the card
                          children: [
                            Text(
                              "Parent/Guardian Current Address",
                              style: TextStyle(color:Color(0xFF003665), fontSize: 17, fontWeight: FontWeight.w600),
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
                          color: Colors.grey[200], // Set the background color to white
                          child: Padding(
                            padding: const EdgeInsets.all(2),
                            child: TextFormField(
                              onChanged: (value) {
                                setState(() {
                                  guardianAddress= value;
                                });
                              },
                              validator: (value) {
                                return value!.isEmpty
                                    ? "Please enter your guardian's current address"
                                    : null;
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


//Guardian's Job
                  const SizedBox(height: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start, // Aligns the entire column to the left
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0), // Same padding as the card
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center, // Align text and asterisk vertically with the card
                          children: [
                            Text(
                              "Job Position",
                              style: TextStyle(color:Color(0xFF003665), fontSize: 17, fontWeight: FontWeight.w600),
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
                          color: Colors.grey[200], // Set the background color to white
                          child: Padding(
                            padding: const EdgeInsets.all(2),
                            child: TextFormField(
                              onChanged: (value) {
                                setState(() {
                                  jobPosition= value;
                                });
                              },
                              validator: (value) {
                                return value!.isEmpty
                                    ? "Please enter your guardian's job position"
                                    : null;
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


//Guardian's Phone
                  const SizedBox(height: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start, // Aligns the entire column to the left
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0), // Same padding as the card
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center, // Align text and asterisk vertically with the card
                          children: [
                            Text(
                              "Phone Number",
                              style: TextStyle(color:Color(0xFF003665), fontSize: 17, fontWeight: FontWeight.w600),
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
                          color: Colors.grey[200], // Set the background color to white
                          child: Padding(
                            padding: const EdgeInsets.all(2),
                            child: TextFormField(
                              keyboardType: TextInputType.phone,
                              onChanged: (value) {
                                setState(() {
                                  guardianPhone = value;
                                });
                              },
                              validator: (value) {
                                return value!.isEmpty
                                    ? "Please enter your guardian's phone number"
                                    : null;
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

//Button        
    //             Row(
    //                 mainAxisAlignment: MainAxisAlignment.start,
    //               children: [
    //                 const Padding(padding: EdgeInsets.only(left: 16)),
    //                 ElevatedButton(
    //                   onPressed: _goToEducationForm, child: const Text('Next')),
    //                   child: const Text('Back'),
    //                   style: ElevatedButton.styleFrom(
    //                     primary: Colors.blue, // Set background color to blue
    //                     onPrimary: Colors.white, // Set text color to white
    //                     minimumSize: const Size(60, 60), // Set the minimum size (width, height)
    //                     shape: RoundedRectangleBorder(
    //                       borderRadius: BorderRadius.zero, // Make the button square
                    
    // //Button
    //                 const Padding(padding: EdgeInsets.only(left: 10)),
    //                 ElevatedButton(
    //                     onPressed: _goBack, child: const Text('Back')),
    //               ]
    //             ),


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
                        onPressed: _goToEducationForm,
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

// Add this part in the appropriate place in your build method