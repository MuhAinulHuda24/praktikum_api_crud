// lib/api_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'user_model.dart';

class ApiService {
  final String baseUrl = "https://reqres.in/api";

  // READ
Future<List<User>> fetchUsers() async {
  final response = await http.get(Uri.parse('https://reqres.in/api/users?page=2'));
  print('Status code: ${response.statusCode}');
  print('Body: ${response.body}');
  if (response.statusCode == 200) {
    final Map<String, dynamic> data = jsonDecode(response.body);
    List<dynamic> userListJson = data['data'];
    return userListJson.map((json) => User.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load users: ${response.statusCode}');
  }
}

  // CREATE
  Future<Map<String, dynamic>> createUser(String name, String job) async {
    final response = await http.post(
      Uri.parse('$baseUrl/users'),
      headers: <String, String>{ 'Content-Type': 'application/json; charset=UTF-8' },
      body: jsonEncode(<String, String>{ 'name': name, 'job': job }),
    );
    if (response.statusCode == 201) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to create user: ${response.statusCode}');
    }
  }

  // UPDATE
  Future<Map<String, dynamic>> updateUser(String id, String name, String job) async {
    final response = await http.put(
      Uri.parse('$baseUrl/users/$id'),
      headers: <String, String>{ 'Content-Type': 'application/json; charset=UTF-8' },
      body: jsonEncode(<String, String>{ 'name': name, 'job': job }),
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to update user: ${response.statusCode}');
    }
  }

  // DELETE
  Future<void> deleteUser(String id) async {
    final response = await http.delete(Uri.parse('$baseUrl/users/$id'));
    if (response.statusCode != 204) {
      throw Exception('Failed to delete user: ${response.statusCode}');
    }
  }
}

