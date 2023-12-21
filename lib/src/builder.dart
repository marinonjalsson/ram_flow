import 'package:flutter/material.dart';
import 'package:ram_flow/src/ctl.dart';
import 'package:ram_flow/src/pipe.dart';

/// FlowBuilder with one FlowRam
class RamFlowBuilder<T> extends StatefulWidget {
  ///
  const RamFlowBuilder({required this.pipe, required this.builder, super.key});

  ///
  final Widget Function(T?) builder;

  ///
  final RamFlowPipe<T> pipe;

  @override
  State<RamFlowBuilder<T>> createState() => _RamFlowBuilderState<T>();
}

class _RamFlowBuilderState<T> extends State<RamFlowBuilder<T>> {
  late final RamFlowCtl<T> ctl;

  @override
  void initState() {
    ctl = widget.pipe.asFlowCtl();
    super.initState();
  }

  @override
  void dispose() {
    ctl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => StreamBuilder<T>(
        stream: ctl.stream,
        //initialData: widget.flowRam.value,
        builder: (_, AsyncSnapshot<T> snapshot) {
          final value = snapshot.data; //?? widget.flowRam.value;
          return widget.builder(value);
        },
      );
}
