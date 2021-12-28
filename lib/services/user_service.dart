import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/models/user_model.dart';

class UserService {
  void getUser() async {
    var url = Uri.parse("https://reqres.in/api/users/2");
    var getResponse = await http.get(url);
    var jsonDecode = json.decode(getResponse.body);
    var result = jsonDecode["data"] as Map<String, dynamic>;
    UserModel.fromJson(result);
  }
}
