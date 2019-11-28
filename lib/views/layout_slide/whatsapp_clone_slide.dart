import 'package:animation_presentation/widgets/slide_stack.dart/slide_stack.dart';
import 'package:flutter/material.dart';

class WhatsAppCloneSlide extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SlideStack(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Text(
                'WhatsApp: workshop',
                style: Theme.of(context).textTheme.title,
              ),
              SizedBox(height: 10,),
              DefaultTextStyle(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Kullanacağımız widgetlar: '),
                    Text('- TabView'),
                    Text('- TabBar'),
                    Text('- Tab'),
                  ],
                ), style: Theme.of(context).textTheme.title.copyWith(fontSize: 30),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
