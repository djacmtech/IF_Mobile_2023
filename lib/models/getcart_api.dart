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
  int? jobid;

  Job? getJob;
  List<Job>? _getCart = [];
  getCart() async {
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
        print(data);
        var jobs = data["data"]["jobs"];
        var jobData = data["data"];
        print(jobs);
        // id = jobs[0]["id"];
        // role = jobs[0]["role"];
        // company = jobs[0]["company"];
        // logo = jobs[0]["logo"];
        // location = jobs[0]["location"];
        // mode = jobs[0]["mode"];
        // stipend = jobs[0]["stipend"];
        // duration = jobs[0]["duration"];
        // about = jobs[0]["about"];
        // skills = jobs[0]["skills"];
        // requirements = jobs[0]["requirements"];
        // perks = jobs[0]["perks"];

        print(response.statusCode);
        var getJob = Data1.fromJson(jobData);
        print(getJob);
        _getCart = getJob.jobs;
        print(_getCart);
        return _getCart;

        // return cartData;
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
