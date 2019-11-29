import 'package:animation_presentation/constants/app_colors.dart';
import 'package:flutter/material.dart';

class NavBarLogo extends StatelessWidget {
  const NavBarLogo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      width: 400,
      child: _Logo(),
    );
  }
}

class _Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      child: Row(
        children: <Widget>[
          Image.network(
            'flutter_izmir_logo.png',
            fit: BoxFit.fitHeight,
          ),
          SizedBox(
            width: 10,
          ),
          FittedBox(
            child: Text("FLUTTER İZMİR",
                style: Theme.of(context).textTheme.display1),
          ),
          SizedBox(
            width: 10,
          ),
          AnimatedContainer(
            duration: Duration(seconds: 1),
            height: 8,
            width: 8,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: accentColor,
            ),
          ),
        ],
      ),
    );
  }
}
