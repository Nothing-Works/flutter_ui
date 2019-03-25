import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'post.g.dart';

@JsonSerializable()
class Post extends Equatable {
  final int userId;
  final int id;
  final String title;
  final String body;

  Post(this.userId, this.id, this.title, this.body)
      : super([userId, id, title, body]);

  @override
  String toString() {
    return 'Post{id: $id}';
  }

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);

  Map<String, dynamic> toJson() => _$PostToJson(this);
}
