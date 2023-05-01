import 'dart:convert';
import 'dart:io';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

class AuthController {
  Future<String> login(
    String username,
    String password,
  ) async {
    Uri uri = Uri.parse('https://acm-if.onrender.com/api/acm-if/login');
    final res = await http.post(uri,
        body: jsonEncode({
          "email": username.toString(),
          "password": password.toString(),
        }),
        headers: {'Content-Type': 'application/json'});
    final body = res.body;
    print(res.statusCode);
    if (res.statusCode != 200) {
      print('incorrect');
      return "incorrect_user_details";
    }

    print(res.body);
    final response = jsonDecode(body);

    init(response);
    return "Success";
  }

  Future<String> register(
    String name,
    String sap,
    String gender,
    String email,
    String whatsapp,
    String dept,
    String academicYear,
    String graduationYear,
    String password,
    String confirmPassword,
    String resume,
    int member,
  ) async {
    final res = await http.post(Uri.parse("https://acm-if.onrender.com/api/acm-if/register"),
        body: jsonEncode({
          "name": name,
          "email": email,
          "sap": sap,
          "contact": whatsapp,
          "gender": gender,
          "academicYear": academicYear,
          "department": dept,
          "graduationYear": graduationYear,
          'acmMember': member.toString(),
          'password': password,
          "confirmPassword": confirmPassword,
          "resume": resume
        }),
        headers: {'Content-Type': 'application/json'});
    // request.fields.addAll({});
    // http.MultipartFile multipartFile = await http.MultipartFile.fromPath(
    //   'resume',
    //   pdf.path,
    //   contentType: MediaType("application", "pdf"),
    // );
    // request.files.add(
    //   multipartFile,
    // );
    // print(name);
    // print(email);
    // print(sap);
    // print(whatsapp);
    // print(gender);
    // print(academicYear);
    // print(dept);
    // print(graduationYear);
    // print(member);
    // print(password);
    // print(confirmPassword);
    // print(pdf);
    // print("request: " + request.toString());
    // var res = await request.send();
    // var responseBody = await res.stream.bytesToString();
    final responseBody = res.body;
    var response = jsonDecode(responseBody);
    print(response);

    if (res.statusCode == 200) {
      // Handle success
      init(response);
      print('Form data submitted successfully');
      return "Success";
    } else {
      // Handle error
      print('Error submitting form data. Status code: ${res.statusCode}');
      return "fail";
    }
  }

  Future<String> resetPassword(String username, String password, String confirmpassword) async {
    Uri uri = Uri.parse('https://acm-if.onrender.com/api/acm-if/forgot-password');
    final res = await http.post(uri,
        body: jsonEncode({
          "email": username.toString(),
          "password": password.toString(),
          "confirmPassword": confirmpassword.toString()
        }),
        headers: {'Content-Type': 'application/json'});
    final body = res.body;
    print(res.statusCode);
    if (res.statusCode != 200) {
      // print('incorrect');
      return "User not found";
    }

    // print(res.body);
    // final response = jsonDecode(body);

    // init(response);
    return "password changed successfully";
  }

  void init(res) async {
    try {
      final box = GetStorage();
      box.write('token', res['token']);
      box.write('id', res['data']['id']);
    } catch (e) {
      print(e);
    }
  }
}
