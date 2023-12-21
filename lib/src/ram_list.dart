import 'package:ram_flow/src/pipe.dart';

///
class RamFlowList<T> extends RamFlowPipe<List<T>> {
  ///
  RamFlowList({
    super.i,
  });

  ///
  final list = <T>[];

  ///
  void add(T item) {
    list.add(item);
    super.pipe(list);
  }

  ///
  bool remove(T item) {
    final result = list.remove(item);
    super.pipe(list);
    return result;
  }

  ///
  void clear() {
    list.clear();
    super.pipe(list);
  }
}
