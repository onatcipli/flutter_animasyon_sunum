import 'package:animation_presentation/views/layout_slide/mobile_device.dart';
import 'package:animation_presentation/widgets/slide_stack.dart/slide_stack.dart';
import 'package:flutter/material.dart';

class FittedBoxLayout extends StatefulWidget {
  @override
  _FittedBoxLayoutState createState() => _FittedBoxLayoutState();
}

class _FittedBoxLayoutState extends State<FittedBoxLayout> {
  BoxFit _boxFit;

  String _value;

  var _type = 'text';

  @override
  void initState() {
    _boxFit = BoxFit.values.first;
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
                        child: Text("FittedBox"),
                      ),
                    ),
                    Expanded(
                      child: FittedBox(
                        fit: BoxFit.contain,
                        child: _type == 'text'
                            ? Text(
                                '''
  FittedBox(
    fit: ${_boxFit.toString()},
    child: Text(_value ?? 'FittedBox'),
  )    
                          ''',
                              )
                            : Text(
                                '''
  FittedBox(
    fit: ${_boxFit.toString()},
    child: FlutterLogo(),
  )                              
                          ''',
                              ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            MobileDevice(
              child: FittedBox(
                fit: _boxFit,
                child: _type == 'text'
                    ? Text(_value ?? 'FittedBox')
                    : FlutterLogo(),
              ),
            ),
            Flexible(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextField(
                    onChanged: (String value) {
                      setState(() {
                        _value = value;
                      });
                    },
                  ),
                  DropdownButton<BoxFit>(
                    value: _boxFit,
                    icon: Icon(Icons.arrow_downward),
                    iconSize: 24,
                    elevation: 16,
                    style: TextStyle(color: Colors.blue),
                    underline: Container(
                      height: 2,
                      color: Colors.blueGrey,
                    ),
                    onChanged: (BoxFit newValue) {
                      setState(() {
                        _boxFit = newValue;
                      });
                    },
                    items: BoxFit.values
                        .map<DropdownMenuItem<BoxFit>>((BoxFit value) {
                      return DropdownMenuItem<BoxFit>(
                        value: value,
                        child: Text(value.toString()),
                      );
                    }).toList(),
                  ),
                  DropdownButton<String>(
                    value: _type,
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
                        _type = newValue;
                      });
                    },
                    items: ['text', 'flutter_logo']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
