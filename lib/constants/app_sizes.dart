import 'package:flutter/material.dart';

double h(BuildContext context, double value) {
  return MediaQuery.of(context).size.height * (value / 896);
}

double w(BuildContext context, double value) {
  return MediaQuery.of(context).size.width * (value / 414);
}

double f(BuildContext context, double value) {
  return MediaQuery.of(context).size.shortestSide * (value / 414);
}

EdgeInsets symmetric(BuildContext context, double vertical, double horizontal) {
  return EdgeInsets.symmetric(
    vertical: h(context, vertical),
    horizontal: w(context, horizontal),
  );
}

EdgeInsets all(BuildContext context, double value) {
  return EdgeInsets.all(h(context, value));
}

EdgeInsets only(
  BuildContext context, {
  double left = 0,
  double right = 0,
  double top = 0,
  double bottom = 0,
}) {
  return EdgeInsets.only(
    left: w(context, left),
    right: w(context, right),
    top: h(context, top),
    bottom: h(context, bottom),
  );
}


