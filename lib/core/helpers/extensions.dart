import 'package:flutter/cupertino.dart';

extension Navigation on BuildContext {
  Future<dynamic> pushNamed(String routeName, {Object? arguments}) {
    return Navigator.pushNamed(this, routeName, arguments: arguments);
  }

  Future<dynamic> pushReplacementNamed(String routeName, {Object? arguments}) {
    return Navigator.pushReplacementNamed(this, routeName,
        arguments: arguments);
  }

  Future<dynamic> pushNamedAndRemoveUntil(String routeName,
      {required RoutePredicate predicate, Object? arguments}) {
    return Navigator.pushNamedAndRemoveUntil(this, routeName, predicate,
        arguments: arguments);
  }

  void pop() => Navigator.pop(this);

  void popDialog() => Navigator.of(this, rootNavigator: true).pop();
}
