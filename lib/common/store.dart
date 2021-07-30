class Store<V> {
  final _cache = <String, StoreEntry<V>>{};
  int _addedCount = 0;

  void add(String id, V value) {
    _cache[id] = StoreEntry<V>(order: ++_addedCount, value: value);
  }

  void remove(String id) {
    _cache.remove(id);
  }

  List<V> all() {
    final List<StoreEntry<V>> entries = _cache.values.toList();
    entries.sort((b, a) => a.order.compareTo(b.order));
    return entries.map((entry) => entry.value).toList();
  }
}

class StoreEntry<V> {
  final int order;
  final V value;

  StoreEntry({required this.order, required this.value});
}
