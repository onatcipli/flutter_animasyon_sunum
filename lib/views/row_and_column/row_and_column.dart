import 'package:animation_presentation/widgets/layout_generator.dart';
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

  int firstFlex = 1;
  int secondFlex = 2;
  int thirdFlex = 3;
  int fourthFlex = 4;

  @override
  void initState() {
    _mainAxisAlignment = MainAxisAlignment.start;
    _crossAxisAlignment = CrossAxisAlignment.start;
    _mainAxisSize = MainAxisSize.min;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            FloatingActionButton(
              child: Icon(Icons.arrow_back),
              onPressed: () {},
            ),
            FloatingActionButton(
              child: Icon(Icons.threed_rotation),
              onPressed: () {
                setState(() {
                  _mainAxisAlignment = MainAxisAlignment.center;
                  _crossAxisAlignment = CrossAxisAlignment.stretch;
                  _mainAxisSize = MainAxisSize.min;
                });
              },
            ),
            FloatingActionButton(
              child: Icon(Icons.threed_rotation),
              onPressed: () {
                setState(() {
                  _mainAxisAlignment = MainAxisAlignment.center;
                  _crossAxisAlignment = CrossAxisAlignment.stretch;
                  _mainAxisSize = MainAxisSize.min;
                });
              },
            ),
          ],
        ),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: Container(),
          ),
          Container(
            height: 667,
            width: 375,
            decoration: BoxDecoration(border: Border.all(width: 1)),
            child: LayoutGenerator(
              mainAxisSize: _mainAxisSize,
              crossAxisAlignment: _crossAxisAlignment,
              mainAxisAlignment: _mainAxisAlignment,
              layoutType: layoutType,
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
              DropdownButton<MainAxisAlignment>(
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
              DropdownButton<CrossAxisAlignment>(
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
                items: CrossAxisAlignment.values
                    .map<DropdownMenuItem<CrossAxisAlignment>>(
                        (CrossAxisAlignment value) {
                  return DropdownMenuItem<CrossAxisAlignment>(
                    value: value,
                    child: Text(value.toString()),
                  );
                }).toList(),
              ),
              DropdownButton<MainAxisSize>(
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
                    .map<DropdownMenuItem<MainAxisSize>>((MainAxisSize value) {
                  return DropdownMenuItem<MainAxisSize>(
                    value: value,
                    child: Text(value.toString()),
                  );
                }).toList(),
              ),
            ],
          ),
          Expanded(
            child: Container(),
          ),
        ],
      ),
    );
  }
}
