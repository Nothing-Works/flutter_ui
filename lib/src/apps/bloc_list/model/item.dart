import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'item.g.dart';

@JsonSerializable()
@immutable
class Item extends Equatable {
  final int id;
  final String title;
  final String body;
  final bool complete;

  Item({this.id, this.title, this.body, this.complete})
      : super([id, title, body, complete]);

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);

  Map<String, dynamic> toJson() => _$ItemToJson(this);

  @override
  String toString() {
    return 'Item{id: $id, title: $title, body: $body, complete: $complete}';
  }
}
