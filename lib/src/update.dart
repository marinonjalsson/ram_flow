// ignore_for_file: public_member_api_docs

import 'package:ram_flow/src/pipe.dart';

/// Very simple flow.
/// Used just send events with no data.
/// Ideal for simple ui updates.
class RamFlowUpdate extends RamFlowPipe<void> {
  RamFlowUpdate({
    super.probe,
  });

  void update() => pipe(null);
}
