import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/api_models.dart';

class PeopleAPIHelper {
  PeopleAPIHelper._();
  static final PeopleAPIHelper peopleAPIHelper = PeopleAPIHelper._();

  Future<People?> fetchPeopleData() async {
    const String baseURL = "https://randomuser.me/api/";
    http.Response res = await http.get(Uri.parse(baseURL));

    if (res.statusCode == 200) {
      Map<String, dynamic> decodedData = jsonDecode(res.body);

      People people = People.fromJSON(data: decodedData);

      print(decodedData);

      return people;
    }
    return null;
  }
}
