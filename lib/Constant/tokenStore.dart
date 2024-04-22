import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class TokenStorage {
  // Store the token securely
  Future<void> saveToken(dynamic token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userData = json.encode(token);
    await prefs.setString('user-data', userData);
    // print("object");
    // print("object");
    // print("object");
    // print("object");
    print(token);
  }

  // Retrieve the token
  Future<Map<String, dynamic>> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String encodedData = prefs.getString('user-data') ??
        '{}'; // Provide a default empty JSON object if 'user-data' is not found.

    Map<String, dynamic> decodedData = json.decode(encodedData);
    // return decodedData;
    // print("object");
    // print("object");
    // print("object");
    print("object");
    print(decodedData);
    return decodedData;
  }

  Future<void> saveorgdata(dynamic data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userData = json.encode(data);
    await prefs.setString('org-data', userData);
  }

  Future<Map<String, dynamic>> getOrgdata() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String encodedData = prefs.getString('org-data') ??
        '{}'; // Provide a default empty JSON object if 'user-data' is not found.
    // print(encodedData);
    Map<String, dynamic> decodedData = json.decode(encodedData);
    // return decodedData;
    // print("object");
    // print("object");
    // print("object");
    // print("object");
    // print(decodedData);
    return decodedData;
  }

  // Delete the token
  Future<void> deleteToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs
        .remove('user-data'); // Remove the 'user-data' key, not 'auth_token'.
  }
}
