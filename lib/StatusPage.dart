import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class StatusPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Card(
      child: ListTile(
        leading: Stack(
          children: <Widget>[
            CircleAvatar(
              radius: 30,
            ),
            Positioned(
                bottom: 0.0,
                right: 1.0,
                child: Container(
                    height: 20,
                    width: 20,
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 20,
                    ))),
          ],
        ),
        title: Text('My Status'),
        subtitle: Text('Tap to upload Status'),
      ),
    ));
  }
}
