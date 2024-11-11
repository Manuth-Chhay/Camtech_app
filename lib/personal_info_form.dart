import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart'; // For formatting dates
import 'package:file_picker/file_picker.dart';
import 'package:path/path.dart' as p; // For getting filename
import 'guardian_info_form.dart';

class SubmissionForm extends StatefulWidget {
  @override
  _SubmissionFormState createState() => _SubmissionFormState();
}

class _SubmissionFormState extends State<SubmissionForm> {
  final _formKey = GlobalKey<FormState>();
  String nameEn = '';
  String nameKh = '';
  String nationality = '';
  String gender = '';
  DateTime? selectedDate;
  String dob = '';
  String pob = '';
  String address = '';
  String country = '';
  String phone = '';
  String email = '';
  File? idFile;

  // Function to show date picker
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        dob = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }

  // Function to pick an image file
  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'pdf', 'jpeg', 'png'], // Allow only jpg and pdf files
    );

    if (result != null) {
      setState(() {
        idFile = File(result.files.single.path!); // Get the selected file
      });
    }
  }

  void _goToParentGuardianForm() {
    if (_formKey.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ParentGuardianForm(
            nameEn: nameEn,
            nameKh: nameKh,
            nationality: nationality,
            gender: gender,
            dob: dob,
            pob: pob,
            address: address,
            country: country,
            phone: phone,
            email: email,
            idFile: idFile,
          ),
        ),
      );
    }
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: const Text('Section 1: Personal Infomation'),
  //         style: const TextStyle(
  //           color: Colors.blue, // Customize the title text color
  //           fontWeight: FontWeight.bold, // Make the text bold (optional)
  //       ),
  //       backgroundColor: Colors.white,
  //     ),
  //     body: Container(
  //       color: Colors.white,
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
            'Section 1: Personal Information',
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

//English Name
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start, // Aligns the entire column to the left
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0), // Same padding as the card
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center, // Align text and asterisk vertically with the card
                          children: [
                            Text(
                              "Student's Full Name in English",
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
                                  nameEn = value;
                                });
                              },
                              validator: (value) {
                                return value!.isEmpty
                                    ? 'Please enter your name in English'
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

                  
  //Khmer Name
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
                              "Student's Full Name in Khmer",
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
                                  nameKh = value;
                                });
                              },
                              validator: (value) {
                                return value!.isEmpty
                                    ? 'Please enter your name in Khmer'
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


// Nationality
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
                                  nationality = value;
                                });
                              },
                              validator: (value) {
                                return value!.isEmpty
                                    ? 'Please enter your nationality'
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


//Gender
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
                              "Gender",
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
                              value: gender.isNotEmpty ? gender : null, // Set the initial value
                              items: ['Male', 'Female',].map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  gender = value!; // Update the selected gender
                                });
                              },
                              validator: (value) {
                                return value == null || value.isEmpty
                                    ? 'Please select your gender'
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


//Date of Birth
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
                              "Date of Birth",
                              style: TextStyle(
                                fontSize: 17,
                                color: Color(0xFF003665), // Use the specified color
                                fontWeight: FontWeight.w600, // Semi-bold
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
                      const SizedBox(height: 8), // Space between the label and the text field
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Card(
                          color: Colors.grey[200],
                          child: Padding(
                            padding: const EdgeInsets.all(2),
                            child: TextFormField(
                              controller: TextEditingController(text: dob), // Controller for DOB
                              decoration: const InputDecoration(
                                suffixIcon: Icon(Icons.calendar_today), // Calendar icon // Grey background for the text field
                                border: InputBorder.none, // Remove the underline
                                contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 16), // Padding inside the text field
                              ),
                              readOnly: true, // Make the text field read-only
                              onTap: () {
                                _selectDate(context); // Function to select date
                              },
                              validator: (value) {
                                return value == null || value.isEmpty
                                    ? 'Please select your Date of Birth'
                                    : null; // Validator for empty selection
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),


//Place of Birth
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
                              "Place of Birth",
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
                                  pob = value;
                                });
                              },
                              validator: (value) {
                                return value!.isEmpty
                                    ? 'Please enter your place of birth'
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

//Current Address
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
                              "Current Address",
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
                                  address = value;
                                });
                              },
                              validator: (value) {
                                return value!.isEmpty
                                    ? 'Please enter your current address'
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


//Country
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
                              "Country",
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
                                  country = value;
                                });
                              },
                              validator: (value) {
                                return value!.isEmpty
                                    ? 'Please enter your country'
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
                  

//Phone Number                  
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
                                  phone = value;
                                });
                              },
                              validator: (value) {
                                return value!.isEmpty
                                    ? 'Please enter your personal phone number'
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



//Email Address
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
                              "Email Address",
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
                              keyboardType: TextInputType.emailAddress,
                              onChanged: (value) {
                                setState(() {
                                  email = value;
                                });
                              },
                              validator: (value) {
                                return value!.isEmpty || !value.contains('@') //|| !value.contains('.')
                                    ? 'Please enter your personal email address'
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


//ID File
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
                              'Birth Certificate, National ID Card or Passport (PDF/JPG)',
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
                                  idFile != null ? p.basename(idFile!.path) : 'No file selected',
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
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start, // Align buttons to the left
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0), // Add spacing between buttons
                      child: ElevatedButton(
                        onPressed: () {
                          // Check if the form is valid and if the file has been uploaded
                            if (idFile == null) {
                              // Show an error if no file is uploaded
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Please upload the IELTS or TOEFL certificate.'),
                                  backgroundColor: Colors.red,
                                ),
                              );
                            } else {
                              // Proceed to the next form if a file is uploaded
                              _goToParentGuardianForm();
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
