import 'package:animation_presentation/constants/app_colors.dart';
import 'package:animation_presentation/routing/route_names.dart';
import 'package:animation_presentation/routing/router.dart';
import 'package:animation_presentation/services/navigation_service.dart';
import 'package:animation_presentation/widgets/centered_view/centered_view.dart';
import 'package:animation_presentation/widgets/navigation_bar/navigation_bar.dart';
import 'package:animation_presentation/widgets/navigation_drawer/navigation_drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'dart:html' as html;

class LayoutTemplate extends StatefulWidget {
  const LayoutTemplate({Key key}) : super(key: key);

  @override
  _LayoutTemplateState createState() => _LayoutTemplateState();
}

class _LayoutTemplateState extends State<LayoutTemplate> {
  @override
  void initState() {
    html.window.addEventListener('keydown', (event) {
      html.KeyboardEvent kevent = event as html.KeyboardEvent;
      if (kevent.keyCode == 37) {
        Provider.of<NavigationService>(context).goBack();
      } else if (kevent.keyCode == 39) {
        Provider.of<NavigationService>(context).navigateToNext();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) => Scaffold(
        drawer: sizingInformation.deviceScreenType == DeviceScreenType.Mobile
            ? NavigationDrawer()
            : null,
        body: Stack(
          children: <Widget>[
            NavigationBar(),
            CenteredView(
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: Navigator(
                      key: Provider.of<NavigationService>(context).navigatorKey,
                      onGenerateRoute: generateRoute,
                      initialRoute: HomeRoute,
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              bottom: 20,
              right: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  FloatingActionButton(
                    backgroundColor: accentColor,
                    heroTag: 1,
                    child: Icon(Icons.arrow_back_ios),
                    onPressed: () {
                      Provider.of<NavigationService>(context).goBack();
                    },
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  FloatingActionButton(
                    backgroundColor: accentColor,
                    heroTag: 2,
                    child: Icon(Icons.arrow_forward_ios),
                    onPressed: () {
                      Provider.of<NavigationService>(context).navigateToNext();
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
