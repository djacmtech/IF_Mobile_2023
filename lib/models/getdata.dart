// ignore_for_file: deprecated_member_use

import 'package:path/path.dart';
import 'package:async/async.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<void> sendFormData(
  String
) async {
  final uri = Uri.parse('https://acm-if.onrender.com/api/acm-if/register');
  final request = http.MultipartRequest('POST', uri);

  // Add form fields
  request.fields['name'] = 'John Doe';
  request.fields['sap'] = '123456';
  request.fields['gender'] = 'Male';
  request.fields['dob'] = '1995-01-01';
  request.fields['email'] = 'johndoe@example.com';
  request.fields['phone'] = '+1 555-555-5555';
  request.fields['whatsapp'] = '+1 555-555-5555';
  request.fields['dept'] = 'Computer Science';
  request.fields['academicYear'] = '3';
  request.fields['graduationYear'] = '2023';
  request.fields['password'] = '2023';
  request.fields['confirmPassword'] = '2023';

  // Add resume file
  final resumeFile = File('/path/to/resume.pdf');
  final stream = http.ByteStream(DelegatingStream.typed(resumeFile.openRead()));
  final length = await resumeFile.length();
  final multipartFile = http.MultipartFile('resume', stream, length, filename: resumeFile.path);
  request.files.add(multipartFile);

  // Send request
  final response = await request.send();
  if (response.statusCode == 200) {
    // Handle success
    print('Form data submitted successfully');
  } else {
    // Handle error
    print('Error submitting form data. Status code: ${response.statusCode}');
  }
}
