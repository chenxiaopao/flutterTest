import 'package:flutter/material.dart';

class UnInterestedButton extends StatefulWidget {
  final VoidCallback onPressed;

  UnInterestedButton(this.onPressed);

  @override
  State<StatefulWidget> createState() {
    return UnInterestedButtonState();
  }
}

class UnInterestedButtonState extends State<UnInterestedButton> with SingleTickerProviderStateMixin{
  AnimationController _animationController;
  Animation<double> _animation;

  @override
  void initState() {

//    _animationController = AnimationController(duration: Duration(seconds: 3),vsync: this);
//    _animation = Tween<double>(begin: 0,end: 300).animate(_animationController)..addListener((){
//      setState(() {});
//    });
//    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Center(child: GestureDetector(
        onTap: this.widget.onPressed,
        child: SizedBox(
          width: MediaQuery.of(context).size.width - 20,
          height: 50,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10.0),
            alignment: Alignment.centerLeft,
            decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                color: Colors.white),
            child: FlatButton.icon(
              onPressed: this.widget.onPressed,
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              padding: EdgeInsets.only(left: 10, top: 15, bottom: 15),
              icon: Icon(Icons.close),
              label: Text('不感兴趣'),
            ),
          ),
        ),
      ),
    );
  }
}
