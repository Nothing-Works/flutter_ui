import '../api/api_item.dart';
import '../model/item.dart';

class ItemRepository {
  final api = ItemApi();

  Future<List<Item>> fetchAll() async => api.fetchItems();
}
