import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:nmg_assignment/app/modules/post_details/models/models.dart';

class PostDetailsController extends GetxController {
  Rxn<PostDetails> postDetails = Rxn();
  RxList<Comment> comments = RxList();

  @override
  void onInit() {
    super.onInit();
    fetchPostDetails();
    fetchComments();
  }

  Future<PostDetails?> fetchPostDetails() async {
    try {
      final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts/${Get.parameters["postId"]!}'));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        postDetails.value = PostDetails.fromJson(data);
        return PostDetails.fromJson(data);
      } else {
        throw Exception('Failed to load post details');
      }
    } catch (e) {
      print('Error fetching post details: $e');
    }
    return null;
  }

  Future<RxList<Comment>> fetchComments() async {
    try {
      final response =
          await http.get(Uri.parse('https://jsonplaceholder.typicode.com/comments?postId=${Get.parameters["postId"]!}'));

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        List<Comment> commentList = data.map((e) => Comment.fromJson(e)).toList();
        comments.value = commentList;
      } else {
        throw Exception('Failed to load comments');
      }
    } catch (e) {
      print('Error fetching comments: $e');
    }
    return comments;
  }
}
