import 'package:animation_presentation/widgets/slide_stack.dart/slide_stack.dart';
import 'package:flutter/material.dart';

class IntroDart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SlideStack(
      children: <Widget>[
        Align(
          child: DefaultTextStyle(
            style: Theme.of(context).textTheme.title.copyWith(fontSize: 35),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Flutter Layout Widgetları',
                  style: Theme.of(context).textTheme.title,
                ),
                Text(
                  '''
                  
    
    - Column                      - Center, Expanded
    - Row                            - Container, Flexible
    - ListView                     - ListTile, Padding
    - GridView                    - FittedBox
    - Stack                          - Align, Positioned
                  ''',
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
