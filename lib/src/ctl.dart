import 'dart:async';

import 'package:ram_flow/src/pipe.dart';
//import 'package:kwlib/src/flow/flow_ram.dart';

///
class RamFlowCtl<T> {
  ///
  RamFlowCtl(RamPipe<T> parent, {bool brodcast = false}) : _parent = parent {
    if (brodcast) {
      _ctl = StreamController.broadcast();
    } else {
      _ctl = StreamController();
    }
    stream = _ctl.stream;
    _parent.addFlowCtl(this);
  }
  final RamPipe<T> _parent;
  late StreamController<T> _ctl;

  ///
  late Stream<T> stream;

  ///
  void resetStream() {
    if (_ctl.hasListener) {
      _ctl.close();
      _ctl = StreamController();
      stream = _ctl.stream;
    }
  }

  ///
  void add({required T data}) {
    _ctl.add(data);
  }

  ///
  void dispose() {
    _parent.removeFlowCtl(this);
    _ctl.close();
  }
}
