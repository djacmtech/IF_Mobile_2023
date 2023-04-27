import 'dart:convert';
import 'dart:io';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

getHistory() async {
  int userid = GetStorage().read("id");
  var headers = {'Content-Type': 'application/x-www-form-urlencoded'};
  var request = http.Request(
      'GET', Uri.parse('https://acm-if.onrender.com/api/acm-if/get-history'));
  request.bodyFields = {'userId': '$userid'};
  request.headers.addAll(headers);

  http.StreamedResponse response = await request.send();
  http.Response streamResponse = await http.Response.fromStream(response);

  var data = jsonDecode(streamResponse.body);
  dynamic history = data["data"];
  // print(response.statusCode);
   print(userid);
  // print(data);
  //print(data["data"][0]["id"]);
 // print(data["data"][0]["jobs"][0]["role"]);
  return history;
}
