import 'dart:convert';
import 'package:hand_mademodel_api/model/user_model.dart';
import 'package:http/http.dart' as http;


class UserServices {
  String _baseUrl = "https://randomuser.me/api/";


  /// Hand Made Model Class without Using fromMap function
  Future<List<UserModel>> fetchUserData(int numberOfUser) async {
    List<UserModel> allUsers = [];
    final url = "${_baseUrl}?results=${numberOfUser}";
    final response = await http.get(Uri.parse(url));
    final allData = jsonDecode(response.body);
    final List data = allData["results"];
    print("All data: ${data}");


    for (var i in data) {
      UserModel user = UserModel(
        title: i["name"]["title"],
        firstName: i["name"]["first"],
        lastName: i["name"]["last"],
        gender: i["gender"],
        country: i["location"]["country"],
      );
      allUsers.add(user);
    }
    return allUsers;
  }

}
