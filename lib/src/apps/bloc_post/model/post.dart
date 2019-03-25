import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'post.g.dart';

@JsonSerializable()
class Post extends Equatable {
  final int id;
  final String title;
  final String body;

  Post({this.id, this.title, this.body}) : super([id, title, body]);

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);

  Map<String, dynamic> toJson() => _$PostToJson(this);

  @override
  String toString() {
    return 'Post {id:$id}';
  }
}
