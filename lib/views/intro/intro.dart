import 'package:animation_presentation/widgets/slide_stack.dart/slide_stack.dart';
import 'package:flutter/material.dart';

class IntroDart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SlideStack(
      children: <Widget>[
        Align(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Flutter Layout konuları',
                style: Theme.of(context).textTheme.title,
              ),
              Text(
                '- Row',
                style: TextStyle(fontSize: 40),
              ),
              Text(
                '- Column',
                style: TextStyle(fontSize: 40),
              ),
              Text(
                '- Stack',
                style: TextStyle(fontSize: 40),
              ),
              Text(
                '- Expanded, Flexible',
                style: TextStyle(fontSize: 40),
              ),
              Text(
                '- FittedBox',
                style: TextStyle(fontSize: 40),
              ),
              Text(
                '- LayoutBuilder',
                style: TextStyle(fontSize: 40),
              ),
              Text(
                '- Center',
                style: TextStyle(fontSize: 40),
              ),
              Text(
                '- Align',
                style: TextStyle(fontSize: 40),
              ),
              Text(
                '- Positioned',
                style: TextStyle(fontSize: 40),
              ),
              Text(
                '- Scrollables',
                style: TextStyle(fontSize: 40),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
