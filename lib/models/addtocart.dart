import 'dart:convert';
import 'dart:io';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

//class Cart {
Future<String> addCart (
  String userid,
  String jobid,
) async {
    Uri uri = Uri.parse('https://acm-if.onrender.com/api/acm-if/login');
    final res = await http.post(uri,
        body: jsonEncode({
          "userid": userid.toString(),
          "jobid": jobid,
        }),
        headers: {'Content-Type': 'application/json'});
    final body = res.body;
    if (res.statusCode != 200) {
      print('Couldnt add to cart');
      return "Couldnt add to cart";
    }

    print(res.body);
    final response = jsonDecode(body);
    return "Success";
}