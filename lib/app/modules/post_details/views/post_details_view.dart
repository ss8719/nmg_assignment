import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/post_details_controller.dart';

class PostDetailsView extends GetView<PostDetailsController> {
  const PostDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post Details'),
        centerTitle: true,
      ),
      body: Obx(() {
        if (controller.postDetails.value == null || controller.comments.isEmpty) {
          return Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
            ),
          );
        } else {
          final postDetails = controller.postDetails.value;
          final comments = controller.comments;
          return SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    postDetails?.title ?? "",
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    postDetails?.body ?? "",
                    style: const TextStyle(fontSize: 18),
                  ),
                  const Divider(),
                  const Text(
                    'Comments:',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  for (var comment in comments)
                    Card(
                      elevation: 4,
                      margin: const EdgeInsets.all(8),
                      child: ListTile(
                        title: Text(
                          comment.name,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(comment.email),
                            Text(comment.body),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),
          );
        }
      }),
    );
  }
}
