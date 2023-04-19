import 'dart:convert';
import 'dart:io';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

//class Cart {
Future<String> addCart (
  int userid,
  int jobid,
) async {
    Uri uri = Uri.parse("https://acm-if.onrender.com/api/acm-if/add-to-cart");
    final res = await http.post(uri,
      body: jsonEncode({
        "userId": userid,
        "jobId": jobid,
      }),
      headers: {'Content-Type': 'application/json'}
      );
    if (res.statusCode != 200) {
      return "Couldnt add to cart";
    }
    print(res.body);
    
    return "Success";
}