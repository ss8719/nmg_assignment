import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:nmg_assignment/app/modules/home/models/home_model.dart';

class HomeController extends GetxController {
  static const String baseUrl = 'https://jsonplaceholder.typicode.com';
  RxList<Post> posts = <Post>[].obs;
  RxList<User> users = <User>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchUsers();
    fetchPosts();
  }

  Future<void> fetchUsers() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/users'));
      if (response.statusCode == 200) {
        final data = json.decode(response.body) as List;
        users.value = data.map((user) => User(id: user['id'], name: user['name'])).toList();
      } else {
        print('Failed to load users: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching users: $e');
    }
  }

  Future<void> fetchPosts() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/posts'));
      if (response.statusCode == 200) {
        final data = json.decode(response.body) as List;
        posts.value = data.map((post) {
          return Post(
            id: post['id'],
            userId: post['userId'],
            title: post['title'],
            body: post['body'],
          );
        }).toList();
      } else {
        print('Failed to load posts: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching posts: $e');
    }
  }
}
