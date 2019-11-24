import 'package:animation_presentation/views/layout_slide/mobile_device.dart';
import 'package:animation_presentation/widgets/slide_stack.dart/slide_stack.dart';
import 'package:flutter/material.dart';

class StackLayout extends StatefulWidget {
  @override
  _StackLayoutState createState() => _StackLayoutState();
}

class _StackLayoutState extends State<StackLayout> {
  StackFit _stackFit;
  Alignment _alignment;

  List<Alignment> _alignmentValues = [
    Alignment.topLeft,
    Alignment.topCenter,
    Alignment.topRight,
    Alignment.centerLeft,
    Alignment.center,
    Alignment.centerRight,
    Alignment.bottomLeft,
    Alignment.bottomCenter,
    Alignment.bottomRight,
  ];

  @override
  void initState() {
    _stackFit = StackFit.values.first;
    _alignment = _alignmentValues.first;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SlideStack(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              flex: 5,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text('Stack'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(18, 0, 100, 18),
                    child: FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text('stack acıklama'),
                    ),
                  ),
                ],
              ),
            ),
            MobileDevice(
              child: Stack(
                fit: _stackFit,
                alignment: _alignment,
                children: <Widget>[
                  Container(
                    height: 200,
                    width: 200,
                    color: Colors.yellow,
                    child: Text('First Child of the Stack'),
                  ),
                  Container(
                    height: 150,
                    width: 150,
                    color: Colors.blue,
                    child: Text('Second Child of the Stack'),
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    color: Colors.green,
                    child: Text('Third Child of the Stack'),
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 1,
              child: Container(),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                DropdownButton<StackFit>(
                  value: _stackFit,
                  icon: Icon(Icons.arrow_downward),
                  iconSize: 24,
                  elevation: 16,
                  style: TextStyle(color: Colors.blue),
                  underline: Container(
                    height: 2,
                    color: Colors.blueGrey,
                  ),
                  onChanged: (StackFit newValue) {
                    setState(() {
                      _stackFit = newValue;
                    });
                  },
                  items: StackFit.values
                      .map<DropdownMenuItem<StackFit>>((StackFit value) {
                    return DropdownMenuItem<StackFit>(
                      value: value,
                      child: Text(value.toString()),
                    );
                  }).toList(),
                ),
                DropdownButton<Alignment>(
                  value: _alignment,
                  icon: Icon(Icons.arrow_downward),
                  iconSize: 24,
                  elevation: 16,
                  style: TextStyle(color: Colors.blue),
                  underline: Container(
                    height: 2,
                    color: Colors.blueGrey,
                  ),
                  onChanged: (Alignment newValue) {
                    setState(() {
                      _alignment = newValue;
                    });
                  },
                  items: _alignmentValues
                      .map<DropdownMenuItem<Alignment>>((Alignment value) {
                    return DropdownMenuItem<Alignment>(
                      value: value,
                      child: Text(value.toString()),
                    );
                  }).toList(),
                ),
              ],
            ),
            Expanded(
              flex: 1,
              child: Container(),
            ),
          ],
        )
      ],
    );
  }
}
