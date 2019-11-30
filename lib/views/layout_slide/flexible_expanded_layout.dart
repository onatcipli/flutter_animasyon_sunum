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
                      padding: const EdgeInsets.all(10.0),
                      child: FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text(
                          '''
  Flexible ve 
  Expanded
                          ''',
                        ),
                      ),
                    ),
                    FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text(
                        '''
  - Expanded Row veya Column içindeki 
    kalan alanı kaplar 
    
  - Column veye Row'u eşit parçalara bölmek
    için Expanded ve Flexible'ın flex
    özelliğini kullanabiliriz
                      ''',
                      ),
                    ),
                  ],
                ),
              ),
              DefaultTextStyle(
                style: Theme.of(context)
                    .textTheme
                    .title
                    .copyWith(color: Colors.white),
                child: MobileDevice(
                  child: layoutType.toLowerCase() == 'column'
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Flexible(
                              flex: firstFlex,
                              fit: FlexFit.tight,
                              child: Container(
                                  color: Colors.blue,
                                  child: Text('$firstFlex')),
                            ),
                            Expanded(
                              flex: secondFlex,
                              child: Container(
                                  color: Colors.yellow,
                                  child: Text('$secondFlex')),
                            ),
                            Expanded(
                              flex: thirdFlex,
                              child: Container(
                                  color: Colors.red, child: Text('$thirdFlex')),
                            ),
                            Expanded(
                              flex: fourthFlex,
                              child: Container(
                                  color: Colors.orange,
                                  child: Text('$fourthFlex')),
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
                                  child: Text('$firstFlex')),
                            ),
                            Expanded(
                              flex: secondFlex,
                              child: Container(
                                  color: Colors.yellow,
                                  child: Text('$secondFlex')),
                            ),
                            Expanded(
                              flex: thirdFlex,
                              child: Container(
                                  color: Colors.red, child: Text('$thirdFlex')),
                            ),
                            Expanded(
                              flex: fourthFlex,
                              child: Container(
                                  color: Colors.orange,
                                  child: Text('$fourthFlex')),
                            ),
                          ],
                        ),
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
                        child: Text('1. flex: ' + value.toString()),
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
                        child: Text('2. flex : ' + value.toString()),
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
                        child: Text('3. flex : ' + value.toString()),
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
                        child: Text('4. flex : ' + value.toString()),
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
        ),
      ],
    );
  }
}
