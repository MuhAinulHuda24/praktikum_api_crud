import 'dart:convert';
import 'package:http/http.dart' as http;
import 'user_model.dart';

class ApiService {

   final String baseUrl = "https://reqres.in/api";

  // READ - GET semua users
  Future<List<User>> fetchUsers() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/users?page=1'));
      
      print('GET Status Code: ${response.statusCode}');
      print('GET Response: ${response.body}');
      
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        List<dynamic> userListJson = data['data'];
        return userListJson.map((json) => User.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load users: ${response.statusCode} - ${response.body}');
      }
    } catch (e) {
      print('Error in fetchUsers: $e');
      throw Exception('Network error: $e');
    }
  }

  // CREATE - POST user baru - DIPERBAIKI
  Future<Map<String, dynamic>> createUser(String name, String job) async {
    try {
      print('Creating user: name=$name, job=$job');
      
      final response = await http.post(
        Uri.parse('$baseUrl/users'), // PERBAIKAN: endpoint yang benar
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          // Tambahkan header auth jika diperlukan
          // 'Authorization': 'Bearer your_token_here',
        },
        body: jsonEncode(<String, String>{
          'name': name,
          'job': job,
        }),
      );
      
      print('POST Status Code: ${response.statusCode}');
      print('POST Response: ${response.body}');
      
      if (response.statusCode == 201) { // 201 Created
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to create user: ${response.statusCode} - ${response.body}');
      }
    } catch (e) {
      print('Error in createUser: $e');
      throw Exception('Network error: $e');
    }
  }

  // UPDATE - PUT user
  Future<Map<String, dynamic>> updateUser(String id, String name, String job) async {
    try {
      final response = await http.put(
        Uri.parse('$baseUrl/users/$id'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'name': name,
          'job': job,
        }),
      );
      
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Failed to update user: ${response.statusCode} - ${response.body}');
      }
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }

  // DELETE - user
  Future<void> deleteUser(String id) async {
    try {
      final response = await http.delete(
        Uri.parse('$baseUrl/users/$id'),
      );
      
      if (response.statusCode != 204) {
        throw Exception('Failed to delete user: ${response.statusCode} - ${response.body}');
      }
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }
}