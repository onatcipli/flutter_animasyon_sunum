import 'package:flutter/material.dart';

class LayoutGenerator extends StatelessWidget {
  final String layoutType;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisSize mainAxisSize;

  const LayoutGenerator({
    Key key,
    this.layoutType,
    this.mainAxisAlignment,
    this.crossAxisAlignment,
    this.mainAxisSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (layoutType.toLowerCase() == 'column') {
      return Scaffold(
        body: Container(
          color: Colors.blue,
          child: Column(
            mainAxisAlignment: mainAxisAlignment,
            crossAxisAlignment: crossAxisAlignment,
            mainAxisSize: mainAxisSize,
            children: <Widget>[
              Icon(
                Icons.layers,
                size: 44,
              ),
              Icon(
                Icons.layers,
                size: 120,
              ),
              Icon(
                Icons.layers,
                size: 155,
              ),
            ],
          ),
        ),
      );
    } else {
      return Scaffold(
        body: Container(
          color: Colors.yellow,
          child: Row(
            mainAxisAlignment: mainAxisAlignment,
            crossAxisAlignment: crossAxisAlignment,
            mainAxisSize: mainAxisSize,
            children: <Widget>[
              Icon(
                Icons.layers,
                size: 44,
              ),
              Icon(
                Icons.layers,
                size: 120,
              ),
              Icon(
                Icons.layers,
                size: 155,
              ),
            ],
          ),
        ),
      );
    }
  }
}
