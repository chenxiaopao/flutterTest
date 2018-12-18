import 'package:flutter/material.dart';

class SeperateLine extends StatelessWidget {
  double height;

  SeperateLine({this.height=10});
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(color: Color.fromARGB(255, 237, 237, 237)),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: height,
      ),
    );
  }
}
