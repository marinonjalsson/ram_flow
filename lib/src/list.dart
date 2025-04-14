import 'package:ram_flow/src/flow.dart';

///
class RamFlowList<T> extends RamFlowPipe<List<T>> {
  ///
  RamFlowList({
    super.probe,
  });

  /// The data. Not connected directly to subscribers.
  /// The functions are connected to subscribers.
  final list = <T>[];

  /// Adds item from list and notifies subscribers.
  void add(T item) {
    list.add(item);
    super.pipe(list);
  }

  /// Removes item from list and notifies subscribers.
  bool remove(T item) {
    final result = list.remove(item);
    super.pipe(list);
    return result;
  }

  /// Deletes all item from list and notifies subscribers.
  void clear() {
    list.clear();
    super.pipe(list);
  }

  /// Moves item to new location and notifies subscrivers.
  void reorder(int newIndex, int oldIndex) {
    final idx = (newIndex > oldIndex) ? newIndex - 1 : newIndex;
    final item = list.removeAt(oldIndex);
    list.insert(idx, item);
    super.pipe(list);
  }

  @override
  void set(List<T> value) {
    list
      ..clear()
      ..addAll(value);
    super.pipe(list);
  }

  @override
  List<T> get value => list;
}
