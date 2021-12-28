class UserModel {
  int? id;
  String? email;

  UserModel({this.id, this.email});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    email = json["email"];
  }
}
