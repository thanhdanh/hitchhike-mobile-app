import 'package:flutter/material.dart';

class LineHorizontalWithTextWidget extends StatelessWidget {
  final String text;

  const LineHorizontalWithTextWidget({
    Key key,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      key: key,
      children: <Widget>[
        Expanded(
          child: new Container(
            margin: const EdgeInsets.only(left: 10.0, right: 20.0),
            child: Divider(
              color: Colors.grey[800],
              height: 36,
            ),
          ),
        ),
        Text(
          text,
        ),
        Expanded(
          child: new Container(
            margin: const EdgeInsets.only(left: 20.0, right: 10.0),
            child: Divider(
              color: Colors.grey[800],
              height: 36,
            ),
          ),
        ),
      ],
    );
  }
}
