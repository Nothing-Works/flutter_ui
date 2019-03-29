import '../api/todo_api.dart';
import '../model/todo.dart';

class TodoRepository {
  final TodoApi todoApi = TodoApi();

  Future<List<Todo>> todos() async => todoApi.fetchAll();
}
