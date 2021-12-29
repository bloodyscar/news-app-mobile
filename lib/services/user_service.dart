import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/models/user_model.dart';

class UserService {
  static Future<List<UserModel>> getUser(int id) async {
    var url = Uri.parse("https://reqres.in/api/users?page=2");
    var response = await http.get(url);
    var jsonDecode = json.decode(response.body);
    var result = (jsonDecode as Map<String, dynamic>)["data"];

    List<UserModel> listUsers = [];
    for (var i = 0; i < result.length; i++) {
      listUsers.add(UserModel.fromJson(result[i]));
    }

    return listUsers;
  }
}
