import 'dart:collection';
import 'dart:ui';
import 'package:ram_flow/src/flow.dart';

///
class RamFlowData<T> extends RamFlow<T> {
  ///
  RamFlowData(
    T init, {
    this.historyLength = 6,
    super.probe,
  }) : _data = init;

  ///
  final int historyLength;
  T _data;

  final Queue<T> _history = Queue();

  ///
  @override
  T get value {
    //if (onGetValue != null) {
    //  return onGetValue!();
    //} else {
    return _data;
    //}
  }

  ///
  Queue<T> get history => _history;

  ///
  @override
  void set(T value) {
    _data = value;
    if (0 < historyLength) {
      _history.addFirst(_data);
      if (historyLength < _history.length) {
        _history.removeLast();
      }
    }
    super.pipe(value);
    //onSetValue?.call(value);
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
