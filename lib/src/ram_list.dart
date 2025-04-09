import 'package:ram_flow/ram_flow.dart';

///
class RamFlowList<T> extends RamFlowPipe<List<T>> {
  ///
  RamFlowList({
    super.probe,
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

  @override
  void set(List<T> value) {
    this.clear();
    this.list.addAll(value);
    super.pipe(this.list);
  }

  @override
  List<T> get value => this.list;
}
