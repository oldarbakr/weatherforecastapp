import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BuildContextProvider extends StatelessWidget {
  final Widget child;
  final BuildContext context;

  BuildContextProvider({required this.child, required this.context});

  @override
  Widget build(BuildContext context) {
    return Provider.value(
      value: this.context,
      child: child,
    );
  }
}
