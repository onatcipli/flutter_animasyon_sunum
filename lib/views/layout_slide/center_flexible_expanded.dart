import 'package:animation_presentation/views/layout_slide/mobile_device.dart';
import 'package:animation_presentation/widgets/slide_stack.dart/slide_stack.dart';
import 'package:flutter/material.dart';

class CenterLayout extends StatefulWidget {
  @override
  _CenterLayoutState createState() => _CenterLayoutState();
}

class _CenterLayoutState extends State<CenterLayout> {
  List<String> sections = ['Center', 'Flexible', 'Expanded', 'Container'];

  String _state;

  @override
  void initState() {
    _state = sections.first;
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
              child: Container(),
            ),
            MobileDevice(
              child: _getChild(
                child: Container(
                    color: Colors.orange,
                    child: Text('MyText')),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                DropdownButton<String>(
                  value: _state,
                  icon: Icon(Icons.arrow_downward),
                  iconSize: 24,
                  elevation: 16,
                  style: TextStyle(color: Colors.blue),
                  underline: Container(
                    height: 2,
                    color: Colors.blueGrey,
                  ),
                  onChanged: (String newValue) {
                    setState(() {
                      _state = newValue;
                    });
                  },
                  items: sections.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            ),
            Expanded(
              child: Container(),
            ),
          ],
        )
      ],
    );
  }

  Widget _getChild({Widget child}) {
    if (_state == 'Center') {
      return Center(
        child: child,
      );
    } else if (_state == 'Expanded') {
      return Column(
        children: <Widget>[
          Text('Other widgets'),
          Text('Other widgets'),
          Text('Other widgets'),
          Expanded(
            child: child,
          ),
        ],
      );
    } else if (_state == 'Flexible') {
      return Column(
        children: <Widget>[
          Text('Other widgets'),
          Text('Other widgets'),
          Text('Other widgets'),
          Flexible(
            child: child,
          ),
        ],
      );
    } else if (_state == 'Container') {
      return Container(
        child: child,
      );
    } else {
      return child;
    }
  }
}
