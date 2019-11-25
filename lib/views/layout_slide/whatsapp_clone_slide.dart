import 'package:animation_presentation/views/layout_slide/mobile_device.dart';
import 'package:animation_presentation/views/whatsapp_ui_clone/whatsapp_clone.dart';
import 'package:animation_presentation/widgets/slide_stack.dart/slide_stack.dart';
import 'package:flutter/material.dart';

class WhatsAppCloneSlide extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SlideStack(
      children: <Widget>[
        MobileDevice(
          child: Text('WhatsApp Clone time'),
        )
      ],
    );
  }
}
