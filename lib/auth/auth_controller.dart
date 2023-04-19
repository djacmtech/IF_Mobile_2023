import 'dart:convert';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class AuthController {
  Future<String> login(
    String username,
    String password,
  ) async {
    Uri uri = Uri.parse('https://acm-if.onrender.com/api/acm-if/login');
    final res = await http.post(uri,
        body: jsonEncode({
          "email": username.toString(),
          "password": password.toString(),
        }),
        headers: {'Content-Type': 'application/json'});
    final body = res.body;
    if (res.statusCode != 200) {
      print('incorrect');
      return "incorrect_user_details";
    }

    print(res.body);   
    final response = jsonDecode(body);
    init(response);
    return "Success";
  }

  void init(res) async {
    try {
      final box = GetStorage();
      box.write('token', res['token']);
      box.write('id', res['user']['id']);
    } catch (e) {
      print(e);
    }

    // String? fcmToken = await _firebaseController.fcmToken;
    // if (fcmToken == null) return;

    // _firebaseController.subscribeToTopic("users");
  }
}
