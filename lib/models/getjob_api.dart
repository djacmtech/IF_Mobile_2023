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
  List<dynamic> requirements = [];
  List<dynamic> skills = [];
  List<dynamic> perks = [];
  String? createdAt;
  String? updatedAt;
  Null? orderId;

  GetJob? getJob;
  List<Data>? _getJob = [];

  getJobData(int low, int high, String? mode) async {
    String url = "https://acm-if.onrender.com/api/acm-if/get-jobs";
    // http.Response response = await http.get(Uri.parse(url));

    var headers = {'Content-Type': 'application/x-www-form-urlencoded'};

    var request = http.Request('GET', Uri.parse(url));
    if (mode != 'null') {
      request.bodyFields = {'lowStipend': '${low}', 'highStipend': '${high}', 'mode': '${mode}'};
      request.headers.addAll(headers);
    } else {
      request.bodyFields = {
        'lowStipend': '${low}',
        'highStipend': '${high}',
      };
      request.headers.addAll(headers);
    }

    http.StreamedResponse response = await request.send();
    print(low);
    print(high);
    print(response.statusCode);
    http.Response streamResponse = await http.Response.fromStream(response);

    try {
      if (response.statusCode == 200) {
        var data = jsonDecode(streamResponse.body);
        print(data);
        // company = data["data"][0]["company"].toString();
        // location = data["data"][0]["location"].toString();
        // stipend = data["data"][0]["stipend"];
        // role = data["data"][0]["role"];
        // mode = data["data"][0]["mode"];
        // duration = data["data"][0]["duration"];
        // logo = data["data"][0]["logo"];
        // id = data["data"][0]["id"];
        // requirements = data["data"][0]["requirements"];
        // perks = data["data"][0]["perks"];
        // skills = data["data"][0]["skills"];
        // about = data["data"][0]["about"];
        // debugPrint(company);
        print(response.statusCode);
        var getJob = GetJob.fromJson(data);
        // if (getJob.message != "No Jobs found") {
        _getJob = getJob.data;
        // } else {
        //   _getJob = [];
        // }

        // var message = getJob.message;
        // print("yash Shah here" + message);
        // if (message == "No Jobs found") {
        //   print("Yash here");
        //   return [];
        // }
        // if (_getJob.m) {
        //   print("Yash here");
        //   return [];
        // }
        return _getJob;
      }
    } on Exception catch (e) {
      print(e);
    }
  }
}
