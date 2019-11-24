import 'package:flutter/material.dart';

class MobileDevice extends StatelessWidget {
  final Widget child;

  const MobileDevice({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 667,
      width: 375,
      decoration: BoxDecoration(border: Border.all(width: 1)),
      child: child,
    );
  }
}
