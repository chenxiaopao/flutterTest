import 'package:flutter/material.dart';

class UnInterestedButton extends StatefulWidget {
  final VoidCallback onPressed;

  UnInterestedButton(this.onPressed);

  @override
  State<StatefulWidget> createState() {
    return UnInterestedButtonState();
  }
}

class UnInterestedButtonState extends State<UnInterestedButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.widget.onPressed,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10.0),
        alignment: Alignment.centerLeft,
        width: MediaQuery.of(context).size.width - 20,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          color: Colors.white
        ),
        height: 50,
        child: FlatButton.icon(
          onPressed: this.widget.onPressed,
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          padding: EdgeInsets.only(left: 10, top: 15, bottom: 15),
          icon: Icon(Icons.close),
          label: Text('不感兴趣'),
        ),
      ),
    );
  }
}
