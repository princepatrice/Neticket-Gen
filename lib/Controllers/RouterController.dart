import 'dart:convert';

import 'package:neticket/Frames/Schemas/router.dart';
import 'package:neticket/Helpers/ResponseReader.dart';
import 'package:http/http.dart' as http;

class RouterController {
  static RouterController instance = RouterController();
  static String baseUrl =
      "https://3675-2600-6c5e-1ef0-470-8848-bd86-cc35-1c92.ngrok.io/api/routeros";
  static List<NRouter> routerList = [];
  RouterController();

  static List<NRouter> getHistoryRouter() {
    return routerList;
  }

  static bool deleteRouter(NRouter router) {
    return routerList.remove(router);
  }

  Future<bool> addRouter(url, username, password) async {
    final Map<String, dynamic> payload = {
      "username": username,
      "password": password,
      "url": url
    };
    dynamic data = await postRequest(baseUrl, payload);

    if (data == false) {
      return false;
    }
    routerList.add(NRouter(
      username: data['username'],
      password: data['password'],
      host: data['ip'],
      name: data['name'],
      serial: data['serial'],
    ));

    return true;
  }

  Future<dynamic> fetchInfo(apiUrl, username, password) async {
    final uri = Uri.parse(apiUrl);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      // Successfully connected to RouterOS, parse the response.
      print('Response data: ${response.body}');
      return response.body;
    } else {
      // Handle connection error or authentication failure.
      print('Failed to connect: ${response.statusCode}');
      return null;
    }
  }

  Future<dynamic> postRequest(apiUrl, payload) async {
    final uri = Uri.parse(apiUrl);
    final response = await http.post(uri,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(payload));
    if (response.statusCode == 200) {
      // Successfully connected to RouterOS, parse the response.
      print('Response data: ${response.body}');
      return ResponseReader.getRequestData(response, response.body);
      ;
    } else {
      // Handle connection error or authentication failure.
      print('Failed to connect: ${response.statusCode}');
      return false;
    }
  }
}
