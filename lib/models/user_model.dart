import 'post_model.dart';

class User {
  final String profileImageUrl;
  final String backgroundImageUrl;
  final String name;
  final int following;
  final int followers;
  final List<Post> posts;
  final List<Post> favorites;

  static const List<Post> defaultVal = [];

  User({
    this.profileImageUrl = 'assets/images/user0.jpg',
    this.backgroundImageUrl = 'assets/images/user_background.jpg',
    this.name = '',
    this.following = 0,
    this.followers = 0,
    this.posts = defaultVal,
    this.favorites = defaultVal,
  });
}
