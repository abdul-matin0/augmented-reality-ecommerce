import 'package:flutter/material.dart';

/// Application refresh widget
class RefreshWidget extends StatelessWidget {
  final Future<void> Function() onRefresh;
  final Widget child;

  const RefreshWidget({Key? key, required this.onRefresh, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      child: child,
    );
  }
}
