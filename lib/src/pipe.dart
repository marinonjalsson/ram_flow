//import 'dart:collection';

import 'package:ram_flow/src/ctl.dart';

///
class RamFlowPipe<T> {
  ///
  RamFlowPipe({
    this.i,
  });
  final List<RamFlowCtl<T>> _flowCtls = [];

  /// The log callback if used.
  final void Function(dynamic)? i;

  ///
  void addFlowCtl(RamFlowCtl<T> flowCtl) => _flowCtls.add(flowCtl);

  ///
  void removeFlowCtl(RamFlowCtl<T> flowCtl) => _flowCtls.remove(flowCtl);

  ///
  RamFlowCtl<T> asFlowCtl({bool brodcast = false}) => RamFlowCtl<T>(
        this,
        brodcast: brodcast,
      );

  ///
  //T get value => _data;

  ///
  //Queue<T> get history => _history;

  ///
  //void notifyAll() {
  //  if (i != null) {
  //    // ignore: prefer_null_aware_method_calls
  //    i!(value);
  //  }
  //  _notifyAll();
  //}

  ///
  //bool isSame(T other) => value == other;

  ///
  //bool isNotSame(T other) => !isSame(other);

  ///
  //void set(T value) {
  //  _data = value;
  //  if (i != null) {
  //    // ignore: prefer_null_aware_method_calls
  //    i!(value);
  //  }
  //  if (0 < historyLength) {
  //    _history.addFirst(_data);
  //    if (historyLength < _history.length) {
  //      _history.removeLast();
  //    }
  //  }
  //  _notifyAll();
  //}
  //void pipeNull(T value) {
  //  //if (i != null) {
  //  //  // ignore: prefer_null_aware_method_calls
  //  //  i!('Pipe:$value');
  //  //}
  //  //for (final ctl in _flowCtls) {
  //  //  ctl.add(data: value);
  //  //}
  //}

  /// Send value of type T to all listeners.
  void pipe(T value) {
    if (i != null) {
      // ignore: prefer_null_aware_method_calls
      i!('Pipe:$value');
    }
    for (final ctl in _flowCtls) {
      ctl.add(data: value);
    }
  }
}
