import 'dart:convert';
import 'dart:developer';

import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:internship_fair/models/getcart_model.dart';

class CartAPI {
  // late Job job;
  int? id;
  String? role;
  String? company;
  String? logo;
  String? location;
  String? mode;
  int? stipend;
  String? duration;
  String? about;
  String? description;
  String? link;
  String? requirements;
  String? skills;
  String? perks;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic orderId;
  Cartjob? cartjob;

  Job? getJob;
  List<Job>? _getJob = [];
  Future<List<Job>?> getCart() async {
    try {
      var request = http.Request(
          'GET', Uri.parse('https://acm-if.onrender.com/api/acm-if/get-cart'));
      request.bodyFields = {'userId': '2'};

      http.StreamedResponse response = await request.send();
      http.Response streamResponse = await http.Response.fromStream(response);
      print(streamResponse.statusCode);

      if (streamResponse.statusCode == 200) {
        // Map<String, dynamic> data = jsonDecode(streamResponse.body);
        // Map<String, dynamic> cartData = data['data']['jobs'];
        var data = jsonDecode(streamResponse.body);
        var jobs = data["jobs"];
        company = data["data"]["jobs"][0]["company"];
        location = data["data"]["jobs"][0]["location"];
        mode = data["data"]["jobs"][0]["mode"];
        stipend = data["data"]["jobs"][0]["stipend"];
        duration = data["data"]["jobs"][0]["duration"];
        about = data["data"]["jobs"][0]["about"];
        role = data["data"][0]["role"];
        logo = data["data"][0]["logo"];
        id = data["data"][0]["id"];
        requirements = data["data"]["jobs"][0][0]["requirements"];
        perks = data["data"]["jobs"][0][0]["perks"];
        skills = data["data"]["jobs"][0][0]["skills"];

        print(response.statusCode);
        var getJob = Data1.fromJson(data);
        _getJob = getJob.jobs;

        return _getJob;

        // return cartData;
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
