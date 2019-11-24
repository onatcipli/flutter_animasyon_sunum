import 'package:animation_presentation/views/layout_slide/mobile_device.dart';
import 'package:animation_presentation/widgets/slide_stack.dart/slide_stack.dart';
import 'package:flutter/material.dart';

class FlexibleExpandedLayout extends StatefulWidget {
  @override
  _FlexibleExpandedLayoutState createState() => _FlexibleExpandedLayoutState();
}

class _FlexibleExpandedLayoutState extends State<FlexibleExpandedLayout> {
  String layoutType = 'Column';

  int firstFlex = 1;
  int secondFlex = 2;
  int thirdFlex = 3;
  int fourthFlex = 4;

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
                      child: Text('Flexible and Expanded'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(18, 0, 100, 18),
                    child: FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text('Flexible and Expanded açıklama'),
                    ),
                  ),
                ],
              ),
            ),
            MobileDevice(
              child: layoutType.toLowerCase() == 'column'
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Flexible(
                          flex: firstFlex,
                          fit: FlexFit.tight,
                          child: Container(
                              color: Colors.blue,
                              child: Text('flex: $firstFlex')),
                        ),
                        Expanded(
                          flex: secondFlex,
                          child: Container(
                              color: Colors.yellow,
                              child: Text('flex: $secondFlex')),
                        ),
                        Expanded(
                          flex: thirdFlex,
                          child: Container(
                              color: Colors.red,
                              child: Text('flex: $thirdFlex')),
                        ),
                        Expanded(
                          flex: fourthFlex,
                          child: Container(
                              color: Colors.orange,
                              child: Text('flex: $fourthFlex')),
                        ),
                      ],
                    )
                  : Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Flexible(
                          flex: firstFlex,
                          fit: FlexFit.tight,
                          child: Container(
                              color: Colors.blue,
                              child: Text('flex: $firstFlex')),
                        ),
                        Expanded(
                          flex: secondFlex,
                          child: Container(
                              color: Colors.yellow,
                              child: Text('flex: $secondFlex')),
                        ),
                        Expanded(
                          flex: thirdFlex,
                          child: Container(
                              color: Colors.red,
                              child: Text('flex: $thirdFlex')),
                        ),
                        Expanded(
                          flex: fourthFlex,
                          child: Container(
                              color: Colors.orange,
                              child: Text('flex: $fourthFlex')),
                        ),
                      ],
                    ),
            ),
            Expanded(
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
                DropdownButton<int>(
                  value: firstFlex,
                  icon: Icon(Icons.arrow_downward),
                  iconSize: 24,
                  elevation: 16,
                  style: TextStyle(color: Colors.black),
                  underline: Container(
                    height: 2,
                    color: Colors.black,
                  ),
                  onChanged: (int newValue) {
                    setState(() {
                      firstFlex = newValue;
                    });
                  },
                  items: [1, 2, 3, 4].map<DropdownMenuItem<int>>((int value) {
                    return DropdownMenuItem<int>(
                      value: value,
                      child: Text('first flex: ' + value.toString()),
                    );
                  }).toList(),
                ),
                DropdownButton<int>(
                  value: secondFlex,
                  icon: Icon(Icons.arrow_downward),
                  iconSize: 24,
                  elevation: 16,
                  style: TextStyle(color: Colors.black),
                  underline: Container(
                    height: 2,
                    color: Colors.black,
                  ),
                  onChanged: (int newValue) {
                    setState(() {
                      secondFlex = newValue;
                    });
                  },
                  items: [1, 2, 3, 4].map<DropdownMenuItem<int>>((int value) {
                    return DropdownMenuItem<int>(
                      value: value,
                      child: Text('second flex : ' + value.toString()),
                    );
                  }).toList(),
                ),
                DropdownButton<int>(
                  value: thirdFlex,
                  icon: Icon(Icons.arrow_downward),
                  iconSize: 24,
                  elevation: 16,
                  style: TextStyle(color: Colors.black),
                  underline: Container(
                    height: 2,
                    color: Colors.black,
                  ),
                  onChanged: (int newValue) {
                    setState(() {
                      thirdFlex = newValue;
                    });
                  },
                  items: [1, 2, 3, 4].map<DropdownMenuItem<int>>((int value) {
                    return DropdownMenuItem<int>(
                      value: value,
                      child: Text('third flex : ' + value.toString()),
                    );
                  }).toList(),
                ),
                DropdownButton<int>(
                  value: fourthFlex,
                  icon: Icon(Icons.arrow_downward),
                  iconSize: 24,
                  elevation: 16,
                  style: TextStyle(color: Colors.black),
                  underline: Container(
                    height: 2,
                    color: Colors.black,
                  ),
                  onChanged: (int newValue) {
                    setState(() {
                      fourthFlex = newValue;
                    });
                  },
                  items: [1, 2, 3, 4].map<DropdownMenuItem<int>>((int value) {
                    return DropdownMenuItem<int>(
                      value: value,
                      child: Text('fourth flex : ' + value.toString()),
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
      ],
    );
  }
}
