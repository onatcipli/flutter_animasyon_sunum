import 'package:animation_presentation/views/layout_slide/mobile_device.dart';
import 'package:animation_presentation/widgets/layout_generator.dart';
import 'package:animation_presentation/widgets/slide_stack.dart/slide_stack.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RowColumnLayout extends StatefulWidget {
  @override
  _RowColumnLayoutState createState() => _RowColumnLayoutState();
}

class _RowColumnLayoutState extends State<RowColumnLayout> {
  MainAxisAlignment _mainAxisAlignment;

  CrossAxisAlignment _crossAxisAlignment;

  MainAxisSize _mainAxisSize;

  String layoutType = 'Column';

  List<CrossAxisAlignment> crossValues = [
    CrossAxisAlignment.start,
    CrossAxisAlignment.stretch,
    CrossAxisAlignment.center,
    CrossAxisAlignment.end
  ];

  @override
  void initState() {
    _mainAxisAlignment = MainAxisAlignment.start;
    _crossAxisAlignment = CrossAxisAlignment.start;
    _mainAxisSize = MainAxisSize.min;
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
                        child: layoutType == 'Row'
                            ? Text('Row   ')
                            : Text('Column'),
                      ),
                    ),
                    Expanded(
                      child: FittedBox(
                        fit: BoxFit.fitWidth,
                        child: layoutType == 'Row'
                            ? Text(
                                '''
  Yatay bir widget dizisi oluşturur.
  
  Row(
    mainAxisAlignment: ${_mainAxisAlignment.toString()},
    crossAxisAlignment: ${_crossAxisAlignment.toString()},
    mainAxisSize: ${_mainAxisSize.toString()},
    children: <Widget>[
      Icon(Icons.layers,size: 44,),
      Icon(Icons.layers,size: 120,),
      Icon(Icons.layers,size: 155,),
    ],
  )
                            ''',
                                textAlign: TextAlign.start,
                              )
                            : Text('''
  Dikey bir widget dizisi oluşturur.
  
  Column(
    mainAxisAlignment: ${_mainAxisAlignment.toString()},
    crossAxisAlignment: ${_crossAxisAlignment.toString()},
    mainAxisSize: ${_mainAxisSize.toString()},
    children: <Widget>[
      Icon(Icons.layers,size: 44,),
      Icon(Icons.layers,size: 120,),
      Icon(Icons.layers,size: 155,),
    ],
  )
                            '''),
                      ),
                    ),
                  ],
                ),
              ),
              MobileDevice(
                child: LayoutGenerator(
                  mainAxisSize: _mainAxisSize,
                  crossAxisAlignment: _crossAxisAlignment,
                  mainAxisAlignment: _mainAxisAlignment,
                  layoutType: layoutType,
                ),
              ),
              SizedBox(
                width: 15,
              ),
              Expanded(
                flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    FittedBox(
                      fit: BoxFit.fitWidth,
                      child: DropdownButton<String>(
                        value: layoutType,
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
                            layoutType = newValue;
                          });
                        },
                        items: <String>[
                          'Column',
                          'Row',
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                    FittedBox(
                      fit: BoxFit.fitWidth,
                      child: DropdownButton<MainAxisAlignment>(
                        value: _mainAxisAlignment,
                        icon: Icon(Icons.arrow_downward),
                        iconSize: 24,
                        elevation: 16,
                        style: TextStyle(color: Colors.blue),
                        underline: Container(
                          height: 2,
                          color: Colors.blueGrey,
                        ),
                        onChanged: (MainAxisAlignment newValue) {
                          setState(() {
                            _mainAxisAlignment = newValue;
                          });
                        },
                        items: MainAxisAlignment.values
                            .map<DropdownMenuItem<MainAxisAlignment>>(
                                (MainAxisAlignment value) {
                          return DropdownMenuItem<MainAxisAlignment>(
                            value: value,
                            child: Text(value.toString()),
                          );
                        }).toList(),
                      ),
                    ),
                    FittedBox(
                      fit: BoxFit.fitWidth,
                      child: DropdownButton<CrossAxisAlignment>(
                        value: _crossAxisAlignment,
                        icon: Icon(Icons.arrow_downward),
                        iconSize: 24,
                        elevation: 16,
                        style: TextStyle(color: Colors.blue),
                        underline: Container(
                          height: 2,
                          color: Colors.blueGrey,
                        ),
                        onChanged: (CrossAxisAlignment newValue) {
                          setState(() {
                            _crossAxisAlignment = newValue;
                          });
                        },
                        items: crossValues
                            .map<DropdownMenuItem<CrossAxisAlignment>>(
                                (CrossAxisAlignment value) {
                          return DropdownMenuItem<CrossAxisAlignment>(
                            value: value,
                            child: Text(value.toString()),
                          );
                        }).toList(),
                      ),
                    ),
                    FittedBox(
                      fit: BoxFit.fitWidth,
                      child: DropdownButton<MainAxisSize>(
                        value: _mainAxisSize,
                        icon: Icon(Icons.arrow_downward),
                        iconSize: 24,
                        elevation: 16,
                        style: TextStyle(color: Colors.blue),
                        underline: Container(
                          height: 2,
                          color: Colors.blueGrey,
                        ),
                        onChanged: (MainAxisSize newValue) {
                          setState(() {
                            _mainAxisSize = newValue;
                          });
                        },
                        items: MainAxisSize.values
                            .map<DropdownMenuItem<MainAxisSize>>(
                                (MainAxisSize value) {
                          return DropdownMenuItem<MainAxisSize>(
                            value: value,
                            child: Text(value.toString()),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
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
}
