import 'package:animation_presentation/widgets/slide_stack.dart/slide_stack.dart';
import 'package:flutter/material.dart';
import 'dart:html' as html;

class HomeContentDesktop extends StatelessWidget {
  const HomeContentDesktop({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SlideStack(
      children: <Widget>[
        _Title(),
        Positioned(
          bottom: 15,
          right: 5,
          child: Row(
            children: <Widget>[
              FlatButton(
                onPressed: () {
                  html.window
                      .open("https://onatcipli.github.io/flutter_layout", "");
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'bit.ly/flutter_layout',
                    style: Theme.of(context)
                        .textTheme
                        .title
                        .copyWith(fontSize: 20),
                  ),
                ),
              ),
              FlatButton(
                onPressed: () {
                  html.window.open("https://twitter.com/CipliOnat", "");
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Twitter: @CipliOnat',
                    style: Theme.of(context)
                        .textTheme
                        .title
                        .copyWith(fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class _Title extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment(0, -0.6),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Text(
          "Flutter Layout: WhatsApp Kullanıcı Arabirimi",
          style: Theme.of(context).textTheme.title,
        ),
      ),
    );
  }
}
