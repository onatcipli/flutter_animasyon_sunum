import 'package:animation_presentation/views/layout_slide/mobile_device.dart';
import 'package:animation_presentation/widgets/slide_stack.dart/slide_stack.dart';
import 'package:flutter/material.dart';

class ContainerLayout extends StatefulWidget {
  @override
  _ContainerLayoutState createState() => _ContainerLayoutState();
}

class _ContainerLayoutState extends State<ContainerLayout> {
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

  List<Color> colors = [
    Colors.black12,
    Colors.blue,
    Colors.orange,
    Colors.green,
    Colors.red,
    Colors.white,
    Colors.brown,
    Colors.black
  ];

  var _borderStyle;

  double _borderWith;

  var _borderColor;

  var _color;

  var _boxShape;

  Alignment _alignment;

  double _margin;

  double _padding;

  double _width;

  double _height;

  @override
  void initState() {
    _width = 150;
    _height = 150;
    _padding = 16;
    _margin = 8;
    _alignment = _alignmentValues.first;
    _boxShape = BoxShape.values.first;
    _color = colors.first;
    _borderColor = colors.last;
    _borderWith = 2;
    _borderStyle = BorderStyle.values.last;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SlideStack(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            DefaultTextStyle(
              style: Theme.of(context).textTheme.title,
              child: Expanded(
                flex: 4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: FittedBox(
                        fit: BoxFit.fitHeight,
                        child: Text("Container"),
                      ),
                    ),
                    Expanded(
                      child: FittedBox(
                        fit: BoxFit.contain,
                        child: Text(
                          '''
  Container(
    child: Text('Container Child'),
    height: $_height,
    width: $_width,
    margin: EdgeInsets.all($_margin),
    padding: EdgeInsets.all($_padding),
    alignment: ${_alignment.toString()},
    decoration: BoxDecoration(
        shape: ${_boxShape.toString()},
        color: $_color,
        border: Border.all(
            color: $_borderColor,
            width: $_borderWith,
            style: $_borderStyle
        )
    ),
  ),
                          ''',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
              flex: 2,
              child: Container(
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.black)),
                child: Container(
                  child: Text('Container Child'),
                  height: _height,
                  width: _width,
                  margin: EdgeInsets.all(_margin),
                  padding: EdgeInsets.all(_padding),
                  alignment: _alignment,
                  decoration: BoxDecoration(
                      shape: _boxShape,
                      color: _color,
                      border: Border.all(
                          color: _borderColor,
                          width: _borderWith,
                          style: _borderStyle)),
                ),
              ),
            ),
            Flexible(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Slider(
                    label: 'Height $_height',
                    value: _height,
                    onChanged: (double value) {
                      setState(() {
                        _height = value;
                      });
                    },
                    divisions: 50,
                    min: 0,
                    max: 500,
                  ),
                  Slider(
                    label: 'Width $_width',
                    value: _width,
                    onChanged: (double value) {
                      setState(() {
                        _width = value;
                      });
                    },
                    divisions: 50,
                    min: 0,
                    max: 350,
                  ),
                  Slider(
                    label: 'Margin $_margin',
                    value: _margin,
                    onChanged: (double value) {
                      setState(() {
                        _margin = value;
                      });
                    },
                    divisions: 50,
                    min: 0,
                    max: 100,
                  ),
                  Slider(
                    label: 'Padding $_padding',
                    value: _padding,
                    onChanged: (double value) {
                      setState(() {
                        _padding = value;
                      });
                    },
                    divisions: 50,
                    min: 0,
                    max: 100,
                  ),
                  Slider(
                    label: 'BorderWidth $_borderWith',
                    value: _borderWith,
                    onChanged: (double value) {
                      setState(() {
                        _borderWith = value;
                      });
                    },
                    divisions: 10,
                    min: 0,
                    max: 10,
                  ),
                  DropdownButton<BorderStyle>(
                    value: _borderStyle,
                    icon: Icon(Icons.arrow_downward),
                    iconSize: 24,
                    elevation: 16,
                    style: TextStyle(color: Colors.blue),
                    underline: Container(
                      height: 2,
                      color: Colors.blueGrey,
                    ),
                    onChanged: (BorderStyle newValue) {
                      setState(() {
                        _borderStyle = newValue;
                      });
                    },
                    items: BorderStyle.values
                        .map<DropdownMenuItem<BorderStyle>>(
                            (BorderStyle value) {
                      return DropdownMenuItem<BorderStyle>(
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
                  DropdownButton<Color>(
                    value: _color,
                    icon: Icon(Icons.arrow_downward),
                    iconSize: 24,
                    elevation: 16,
                    style: TextStyle(color: Colors.blue),
                    underline: Container(
                      height: 2,
                      color: Colors.blueGrey,
                    ),
                    onChanged: (Color newValue) {
                      setState(() {
                        _color = newValue;
                      });
                    },
                    items: colors.map<DropdownMenuItem<Color>>((Color value) {
                      return DropdownMenuItem<Color>(
                        value: value,
                        child: Text(value.toString()),
                      );
                    }).toList(),
                  ),
                  DropdownButton<Color>(
                    value: _borderColor,
                    icon: Icon(Icons.arrow_downward),
                    iconSize: 24,
                    elevation: 16,
                    style: TextStyle(color: Colors.blue),
                    underline: Container(
                      height: 2,
                      color: Colors.blueGrey,
                    ),
                    onChanged: (Color newValue) {
                      setState(() {
                        _borderColor = newValue;
                      });
                    },
                    items: colors.map<DropdownMenuItem<Color>>((Color value) {
                      return DropdownMenuItem<Color>(
                        value: value,
                        child: Text(value.toString()),
                      );
                    }).toList(),
                  )
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
