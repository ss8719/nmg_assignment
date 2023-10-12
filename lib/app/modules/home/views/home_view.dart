import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nmg_assignment/app/modules/home/controllers/home_controller.dart';
import 'package:nmg_assignment/app/routes/app_pages.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
        centerTitle: true,
      ),
      body: Obx(
        () {
          if (controller.posts.isEmpty || controller.users.isEmpty) {
            return Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
              ),
            );
          } else {
            return ListView.builder(
              itemCount: controller.posts.length,
              itemBuilder: (context, index) {
                final post = controller.posts[index];
                final user = controller.users.firstWhere((user) => user.id == post.userId);
                return GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.POST_DETAILS, parameters: {"postId": controller.posts[index].id.toString()});
                  },
                  child: Card(
                    margin: const EdgeInsets.all(8),
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      title: Text(
                        post.title,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      subtitle: Text(
                        'By: ${user.name}',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
