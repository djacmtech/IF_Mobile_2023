import 'dart:convert';
import 'dart:io';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

//class Cart {
Future<String> addCart(
  int userid,
  int jobid,
) async {
  print("yash" + userid.toString());
  print(jobid);
  Uri uri = Uri.parse("https://acm-if.onrender.com/api/acm-if/add-to-cart");
  final res = await http.post(uri,
      body: jsonEncode({
        "userId": userid,
        "jobId": jobid,
      }),
      headers: {'Content-Type': 'application/json'});
  print(res.statusCode);
  final response = jsonDecode(res.body);
  print(response["message"]);
  if (response["message"] == 'Job already in cart') {
    return 'Job already in cart';
  } else if (response["message"] == 'Job already ordered') {
    return 'Job ordered already';
  } else if (res.statusCode != 200 && res.statusCode != 400) {
    print("Couldnt add to cart");
    return "Couldnt add to cart";
  }
  print(res.body);

  //print(response['data']['jobs'][0]['cartjob']['cartId']);
  // try {
  //   final box = GetStorage();
  //   // box.write('token', res['token']);
  //   box.write('cartId', response['data']['jobs'][0]['cartjob']['cartId']);

  // } catch (e) {
  //   print(e);
  // }

  return "Success";
}
