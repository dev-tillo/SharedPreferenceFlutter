import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:networking/api/ApiConstants.dart';
import 'package:networking/model/GetFromApi.dart';

class ApiService {
  Future<List<GetFromApi>?> getUsers() async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.usersEndpoint);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<GetFromApi> _model = GetFromApi.fromJson(response.body) as List<GetFromApi>;
        return _model;
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
