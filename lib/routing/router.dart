import 'package:animation_presentation/routing/route_names.dart';
import 'package:animation_presentation/views/home/home_view.dart';
import 'package:animation_presentation/views/intro/intro.dart';
import 'package:animation_presentation/views/layout_slide/center_flexible_expanded.dart';
import 'package:animation_presentation/views/layout_slide/flexible_expanded_layout.dart';
import 'package:animation_presentation/views/layout_slide/row_column_layout.dart';
import 'package:animation_presentation/views/layout_slide/stack_layout.dart';
import 'package:animation_presentation/views/layout_slide/whatsapp_clone_slide.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case HomeRoute:
      return _getPageRoute(HomeView(), settings.name);
      break;
    case IntroPath:
      return _getPageRoute(IntroDart(), settings.name);
    case RowAndColumn:
      return _getPageRoute(RowColumnLayout(), settings.name);
    case FlexibleExpanded:
      return _getPageRoute(FlexibleExpandedLayout(), settings.name);
    case CenterLayoutPath:
      return _getPageRoute(CenterLayout(), settings.name);
    case StackLayoutPath:
      return _getPageRoute(StackLayout(), settings.name);
    case WhatsAppClonePath:
      return _getPageRoute(WhatsAppCloneSlide(), settings.name);
    default:
  }
}

PageRoute _getPageRoute(Widget child, String routeName) {
  return _FadeRoute(child: child, routeName: routeName);
}

class _FadeRoute extends PageRouteBuilder {
  final Widget child;
  final String routeName;

  _FadeRoute({this.child, this.routeName})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              child,
          settings: RouteSettings(name: "$routeName"),
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              ScaleTransition(
            scale: Tween<double>(
              begin: 0.0,
              end: 1.0,
            ).animate(
              CurvedAnimation(
                parent: animation,
                curve: Curves.fastOutSlowIn,
              ),
            ),
            child: SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(-1, 0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            ),
          ),
        );
}
