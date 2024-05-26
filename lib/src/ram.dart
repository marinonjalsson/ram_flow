import 'dart:collection';
import 'package:ram_flow/src/pipe.dart';

///
class RamFlow<T> extends RamFlowPipe<T> {
  ///
  RamFlow(
    T init, {
    this.historyLength = 6,
    super.probe,
  }) : _data = init;

  ///
  final int historyLength;
  T _data;

  final Queue<T> _history = Queue();

  ///
  T get value => _data;

  ///
  Queue<T> get history => _history;

  ///
  void notifyAll() {
    super.pipe(value);
  }

  ///
  bool isSame(T other) => value == other;

  ///
  bool isNotSame(T other) => !isSame(other);

  ///
  void set(T value) {
    _data = value;
    if (0 < historyLength) {
      _history.addFirst(_data);
      if (historyLength < _history.length) {
        _history.removeLast();
      }
    }
    super.pipe(value);
  }

  /// Add value to data. Works only with int and double.
  void add(T value) {
    if (_data == null) {
      set(value);
      return;
    }
    switch (T.runtimeType) {
      case double:
        final d = _data as double;
        final v = value as double;
        set((v + d) as T);
      case int:
        final d = _data as int;
        final v = value as int;
        set((v + d) as T);
      default:
        throw Exception(
            "Can not use 'add' function with ${T.runtimeType} type! ");
    }
  }
}
