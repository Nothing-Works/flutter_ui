import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'todo.g.dart';

@JsonSerializable()
@immutable
class Todo extends Equatable {
  final int id;
  final String title;
  final String body;
  final bool complete;

  Todo({this.id, this.title, this.body, this.complete})
      : super([id, title, body, complete]);

  factory Todo.fromJson(Map<String, dynamic> json) => _$TodoFromJson(json);

  Map<String, dynamic> toJson() => _$TodoToJson(this);

  Todo copyWith({int id, String title, String body, bool completed}) {
    return Todo(
        id: id ?? this.id,
        title: title ?? this.title,
        body: body ?? this.body,
        complete: completed ?? this.complete);
  }

  @override
  String toString() {
    return 'Todo{id: $id, title: $title, body: $body, completed: $complete}';
  }
}
