import 'package:ram_flow/src/ram.dart';

/// Awaliable states.
// ignore: public_member_api_docs
enum RamFlowUiState { show, init, hide, error }

/// Very simple flow.
/// Used just send ui events.
/// Ideal for simple ui updates.
class RamFlowUi extends RamFlow<RamFlowUiState> {
  ///
  RamFlowUi({
    super.probe,
  }) : super(RamFlowUiState.init);

  //void update() => pipe(FlowUiState.init);
}

//class UiCtl {
//  UiCtl({bool isBroadcast = false, Log? log})
//      : _log = log,
//        _streamCtl =
//            isBroadcast ? StreamController.broadcast() : StreamController();
//  UiCtl.brodcast({Log? log})
//      : _log = log,
//        _streamCtl = StreamController.broadcast();
//  StreamController<UiState> _streamCtl;
//  Stream<UiState> get stream => _streamCtl.stream;
//  Log? _log;
//  UiState _state = UiState.init;
//  UiState get state => _state;
//  void sendAlways(UiState state) {
//    _state = state;
//    _log?.i('UiCtl: $_state');
//    _streamCtl.add(_state);
//  }
//
//  void send(UiState state) {
//    if (_state != state) {
//      _state = state;
//      _log?.i('UiCtl (changed): $_state');
//      _streamCtl.add(_state);
//    }
//  }
//
//  void dispose() {
//    _streamCtl.close();
//  }
//}
