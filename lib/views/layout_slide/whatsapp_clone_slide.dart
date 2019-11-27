import 'package:animation_presentation/widgets/slide_stack.dart/slide_stack.dart';
import 'package:flutter/material.dart';

class WhatsAppCloneSlide extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SlideStack(
      children: <Widget>[
        Text(
          'Live Coding: WhatsApp UI clone',
          style: Theme.of(context).textTheme.title,
        )
      ],
    );
  }
}
