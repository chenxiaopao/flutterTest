import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  final VoidCallback searchOnPressed;
  final VoidCallback requestOnPressed;
  final String searchBarText;
  final String rightBtnText;
  final Icon rightIcon;

  bool searchIsTap;
  bool requestIsTap;

  SearchBar({
    @required this.searchBarText,
    this.rightBtnText='',
    @required this.rightIcon,
    @required this.searchOnPressed,
    @required this.requestOnPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
//      width: MediaQuery.of(context).size.width-100,
      height: 30,
      child: Row(
        children: <Widget>[
          Expanded(
            child: FlatButton.icon(
              textColor: Colors.grey,
              color: Color.fromARGB(255, 237, 237, 237),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
              ),
              onPressed: searchOnPressed,
              icon: Icon(
                Icons.search,
                color: Colors.grey,
              ),
              label: Text(searchBarText),
            ),
          ),
          FlatButton.icon(
            onPressed: requestOnPressed,
            icon: rightIcon,
            label: Text(
              rightBtnText,
              style: TextStyle(color: Colors.blue),
            ),
          ),
        ],
      ),
    );
  }
}
