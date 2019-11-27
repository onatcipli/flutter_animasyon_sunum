import 'package:animation_presentation/widgets/slide_stack.dart/slide_stack.dart';
import 'package:flutter/material.dart';

class WhatsAppCloneSlide extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SlideStack(
      children: <Widget>[
        Text(
          'Canlı Kodlama: WhatsApp',
          style: Theme.of(context).textTheme.title,
        )
      ],
    );
  }
}
