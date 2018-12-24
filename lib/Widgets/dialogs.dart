import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void showUninterestedAlert(Widget child, BuildContext context) {
  showDialog<Null>(
    context: context,
    builder: (context) {
      return child;
    },
  );

}
