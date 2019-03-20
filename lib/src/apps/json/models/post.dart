class Post {
  final String title;
  final String body;

  Post(this.title, this.body);

  Post.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        body = json['body'];
}
