import 'dart:collection';
import 'dart:ui';
import 'package:ram_flow/src/pipe.dart';

///
class RamFlow<T> extends RamFlowPipe<T> {
  ///
  RamFlow(
    T init, {
    this.onNewValue,
    this.historyLength = 6,
    super.probe,
  }) : _data = init {
    onNewValue?.call(init);
  }

  /// Callback function for new value.
  /// Can be used for updating another RAM value.
  void Function(T)? onNewValue;

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
    onNewValue?.call(value);
  }

  ///
  void setIfNotSame(T value) {
    if (isNotSame(value)) {
      set(value);
    }
  }

  /// Add value to data. Works only with int, double and Offset.
  void add(T value) {
    if (_data == null) {
      set(value);
      return;
    }
    switch (T) {
      case double:
        final d = _data as double;
        final v = value as double;
        set((v + d) as T);
      case int:
        final d = _data as int;
        final v = value as int;
        set((v + d) as T);
      case Offset:
        final d = _data as Offset;
        final v = value as Offset;
        set(Offset(d.dx + v.dx, d.dy + v.dy) as T);
      default:
        throw Exception(
          "Can not use 'add' function with ${T.runtimeType} type! ",
        );
    }
  }
}
