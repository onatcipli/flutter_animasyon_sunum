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

  double _bottom = 0;
  double _right = 0;

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
        DefaultTextStyle(
          style: Theme.of(context).textTheme.title,
          child: Row(
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
                        fit: BoxFit.fitHeight,
                        child: Text('Stack      '),
                      ),
                    ),
                    Expanded(
                      child: FittedBox(
                        fit: BoxFit.fitHeight,
                        child: Text('''
  Stack widget'ı sayesinde istediğimiz                
  widget'ları üst üste koyabiliyoruz
  
  Stack(
    fit: ${_stackFit.toString()},
    alignment: ${_alignment.toString()},
    children: <Widget>[
      buildStackChild(size: 200,
          text: "1",color: Colors.blue),
      buildStackChild(size: 150,
          text: "2", color: Colors.orange),
      buildStackChild(size: 100,
          text: "3", color: Colors.green),
      Positioned(
          bottom: $_bottom,right: $_right,
          child: buildStackChild(size: 50,
          text: "4", color: Colors.amber),),
    ],
  )
                        '''),
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
                    buildStackChild(size: 200, text: "1", color: Colors.blue),
                    buildStackChild(size: 150, text: "2", color: Colors.orange),
                    buildStackChild(size: 100, text: "3", color: Colors.green),
                    Positioned(
                        bottom: _bottom,
                        right: _right,
                        child: buildStackChild(
                            size: 50, text: "4", color: Colors.amber)),
                  ],
                ),
              ),
              SizedBox(
                width: 15,
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
                  Slider(
                    label: 'Bottom',
                    value: _bottom,
                    onChanged: (double value) {
                      setState(() {
                        _bottom = value;
                      });
                    },
                    min: 0,
                    max: 550,
                  ),
                  Slider(
                    label: 'Right',
                    value: _right,
                    onChanged: (double value) {
                      setState(() {
                        _right = value;
                      });
                    },
                    min: 0,
                    max: 250,
                  )
                ],
              ),
              Expanded(
                flex: 1,
                child: Container(),
              ),
            ],
          ),
        )
      ],
    );
  }

  Container buildStackChild({String text, double size, Color color}) {
    return Container(
      height: size,
      width: size,
      color: color,
      child: FittedBox(fit: BoxFit.fitHeight, child: Text(text)),
    );
  }
}
