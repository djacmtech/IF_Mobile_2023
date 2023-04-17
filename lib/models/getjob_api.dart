import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:internship_fair/models/getjob_model.dart';

class GetJobApi {
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
  String? createdAt;
  String? updatedAt;
  Null? orderId;

  GetJob? getJob;
  List<Data>? _getJob = [];

  getJobData() async {
    String url = "https://acm-if.onrender.com/api/acm-if/get-jobs";
    http.Response response = await http.get(Uri.parse(url));
    try {
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        company = data["data"][0]["company"].toString();
        location = data["data"][0]["location"].toString();
        stipend = data["data"][0]["stipend"];
        role = data["data"][0]["role"];
        mode = data["data"][0]["mode"];
        duration = data["data"][0]["duration"];
        logo = data["data"][0]["logo"];
        debugPrint(company);
        print(response.statusCode);
        var getJob = GetJob.fromJson(data);
        _getJob = getJob.data;
        return _getJob;
      }
    } on Exception catch (e) {
      print(e);
    }
  }
}
