import 'package:animation_presentation/routing/route_names.dart';
import 'package:animation_presentation/views/first_animation/first_animation_view.dart';
import 'package:animation_presentation/views/home/home_view.dart';
import 'package:animation_presentation/views/layout_slide/center_flexible_expanded.dart';
import 'package:animation_presentation/views/layout_slide/flexible_expanded_layout.dart';
import 'package:animation_presentation/views/layout_slide/row_column_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case HomeRoute:
      return _getPageRoute(HomeView(), settings.name);
      break;
    case FirstAnimation:
      return _getPageRoute(FirstAnimationView(), settings.name);
    case RowAndColumn:
      return _getPageRoute(RowColumnLayout(), settings.name);
    case FlexibleExpanded:
      return _getPageRoute(FlexibleExpandedLayout(), settings.name);
    case CenterLayoutPath:
      return _getPageRoute(CenterLayout(), settings.name);
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
            child: RotationTransition(
              turns: Tween<double>(
                begin: 0.0,
                end: 1.0,
              ).animate(
                CurvedAnimation(
                  parent: animation,
                  curve: Curves.linear,
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
          ),
        );
}
