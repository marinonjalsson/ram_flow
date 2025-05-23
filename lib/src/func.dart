import 'package:ram_flow/src/flow.dart';

///
class RamFlowFunc<T> extends RamFlowPipe<T> {
  ///
  RamFlowFunc({
    required this.onSetValue,
    required this.onGetValue,
    super.log,
  });

  /// Callback function for new value.
  /// Can be used for updating another RAM value.
  void Function(T) onSetValue;

  /// Callback function for handling/reading/getting the value.
  T Function() onGetValue;

  ///
  @override
  T get value => onGetValue();

  ///
  @override
  void set(T value) {
    super.pipe(value);
    onSetValue.call(value);
  }
}
