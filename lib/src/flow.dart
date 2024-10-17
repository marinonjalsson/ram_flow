import 'package:ram_flow/src/pipe.dart';

///
abstract class RamFlow<T> extends RamPipe<T> {
  ///
  RamFlow({
    super.probe,
  });

  ///
  T get value;

  ///
  void notifyAll() {
    super.pipe(value);
  }

  ///
  bool isSame(T other) => value == other;

  ///
  bool isNotSame(T other) => !isSame(other);

  ///
  void set(T value);

  ///
  void setIfNotSame(T value) {
    if (isNotSame(value)) {
      set(value);
    }
  }
}
