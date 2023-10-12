class Post {
  final int id;
  final int userId;
  final String title;
  final String body;

  Post({
    required this.id,
    required this.userId,
    required this.title,
    required this.body,
  });
}

class User {
  final int id;
  final String name;

  User({
    required this.id,
    required this.name,
  });
}
