import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:suitmedia_test/models/user.dart';

class WebService {
  Future<List<UserModel>> getUserList() async {
    String urlPage1 = 'https://reqres.in/api/users?page=1&per_page=10';

    final response = await http.get(Uri.parse(urlPage1));

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);

      List list = result['data'];

      return list.map((user) => UserModel.fromJSON(user)).toList();
    } else {
      throw Exception('Failed to get List');
    }
  }

  Future<List<UserModel>> getPage2() async {
    String urlPage2 = 'https://reqres.in/api/users?page=2&per_page=10';

    final response = await http.get(Uri.parse(urlPage2));

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);

      List list = result['data'];

      return list.map((user) => UserModel.fromJSON(user)).toList();
    } else {
      throw Exception('Failed to get List');
    }
  }
}
