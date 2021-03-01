import 'package:flutter/material.dart';

class HitchhikeItemWidget extends StatefulWidget {
  @override
  _HitchhikeItemWidgetState createState() => _HitchhikeItemWidgetState();
}

class _HitchhikeItemWidgetState extends State<HitchhikeItemWidget> {
  String _title;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(),
        ],
      ),
    );
  }
}
