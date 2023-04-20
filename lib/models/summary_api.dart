import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import 'summary_model.dart' as SummaryClass;

class SummaryApi {
  // String? interviewCount;
  // String? totalPrice;
  // String? discount;
  late int interviewCount;
  late int totalPrice;
  late int discount;
  late int cartID;

  SummaryClass.Summary? getData;
  List<SummaryClass.Data>? _getData = [];
  List<SummaryClass.Jobs>? _getJob = [];
  List<int> sum = [];

  // List<SummaryClass.Summary>? _getSummary = [];

  Future<List<int?>> getSummaryInfo() async {
    var headers = {'Content-Type': 'application/x-www-form-urlencoded'};

    String url = "https://acm-if.onrender.com/api/acm-if/get-summary";
    http.Request request = http.Request('GET', Uri.parse(url));
    cartID = GetStorage().read('cartId');
    int userID = GetStorage().read('id');
    print(userID);
    print(cartID);

    request.bodyFields = {'userId': '$userID', 'cartId': '$cartID'};
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    http.Response streamResponse = await http.Response.fromStream(response);
    print(response.statusCode);

    if (response.statusCode == 200) {
      var res = jsonDecode(streamResponse.body);
      print(res);
      totalPrice = res["data"]["totalPrice"];
      print(totalPrice);
      discount = res["data"]["discount"];
      var summary = SummaryClass.Summary?.fromJson(res);
      _getJob = summary.data.jobs;
      interviewCount = _getJob!.length;
      print(interviewCount.runtimeType);
      print(interviewCount);
      print("Hello");
      sum = [interviewCount, totalPrice, discount];
      print(sum);
      
    }
    return sum;
  }
}
