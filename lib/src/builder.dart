import 'package:flutter/material.dart';
import 'package:ram_flow/ram_flow.dart';

/// FlowBuilder with one FlowRam
class RamFlowBuilder<T> extends StatefulWidget {
  ///
  const RamFlowBuilder({required this.ram, required this.builder, super.key});

  ///
  final Widget Function(T) builder;

  ///
  final RamFlow<T> ram;

  @override
  State<RamFlowBuilder<T>> createState() => _RamFlowBuilderState<T>();
}

class _RamFlowBuilderState<T> extends State<RamFlowBuilder<T>> {
  late final RamFlowCtl<T> ctl;

  @override
  void initState() {
    ctl = widget.ram.asFlowCtl();
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
        //initialData: widget.ram.value,
        builder: (_, AsyncSnapshot<T> snapshot) {
          //final value = snapshot.data; //?? widget.flowRam.value;
          return widget.builder(widget.ram.value);
        },
      );
}
