import 'dart:math';

import 'package:animation_presentation/views/layout_slide/mobile_device.dart';
import 'package:animation_presentation/widgets/slide_stack.dart/slide_stack.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GridViewLayout extends StatefulWidget {
  @override
  _GridViewLayoutState createState() => _GridViewLayoutState();
}

class _GridViewLayoutState extends State<GridViewLayout> {
  int _crossAxisCount = 2;

  @override
  void initState() {
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
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: FittedBox(
                        fit: BoxFit.fitHeight,
                        child: Text("GridView"),
                      ),
                    ),
                    Expanded(
                      child: FittedBox(
                        fit: BoxFit.fitHeight,
                        child: Text('''
  GridView.count(
    crossAxisCount: $_crossAxisCount,
    children: List.generate(100, (index) {
      return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            color: Colors.orange,
            child: Center(
              child: Text(
                'Item \$index',
                style: Theme.of(context).textTheme.headline,
              ),
            ),
          ),
      );
    }),
  )
                        '''),
                      ),
                    ),
                  ],
                ),
              ),
              MobileDevice(
                child: GridView.count(
                  // Create a grid with 2 columns. If you change the scrollDirection to
                  // horizontal, this produces 2 rows.
                  crossAxisCount: _crossAxisCount,
                  // Generate 100 widgets that display their index in the List.
                  children: List.generate(100, (index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        color: Colors.orange,
                        child: Center(
                          child: Text(
                            'Item $index',
                            style: Theme.of(context).textTheme.headline,
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
              Flexible(
                flex: 1,
                child: DropdownButton<int>(
                  value: _crossAxisCount,
                  icon: Icon(Icons.arrow_downward),
                  iconSize: 24,
                  elevation: 16,
                  style: TextStyle(color: Colors.blue),
                  underline: Container(
                    height: 2,
                    color: Colors.blueGrey,
                  ),
                  onChanged: (int newValue) {
                    setState(() {
                      _crossAxisCount = newValue;
                    });
                  },
                  items: [1, 2, 3, 4, 5].map<DropdownMenuItem<int>>((int value) {
                    return DropdownMenuItem<int>(
                      value: value,
                      child: Text(value.toString()),
                    );
                  }).toList(),
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
