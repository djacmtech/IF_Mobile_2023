import 'dart:convert';
import 'dart:io';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

class PaymentController {
  Future<String> payment(
    String paymentMode,
    File paymentProof,
  ) async {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse("https://acm-if.onrender.com/api/acm-if/create-order"),
    );
    request.fields.addAll({"paymentMode": paymentMode, "userId": GetStorage().read('id').toString()});
    http.MultipartFile multipartFile = await http.MultipartFile.fromPath(
      'paymentProof',
      paymentProof.path,
      contentType: MediaType('image', 'jpeg'),
    );
    request.files.add(
      multipartFile,
    );
    var res = await request.send();
    var responseBody = await res.stream.bytesToString();
    // print(response)
    var response = jsonDecode(responseBody);
    print(response);

    if (res.statusCode == 200) {
      // Handle success
      print('Form data submitted successfully');
      return "Success";
    } else {
      // Handle error
      print('Error submitting form data. Status code: ${res.statusCode}');
      return "fail";
    }
  }
}
