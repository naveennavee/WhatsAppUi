import 'package:flutter/material.dart';

import 'ChatPage.dart';

class Contacts extends StatefulWidget {
  @override
  _contact createState() => _contact();
}

// ignore: camel_case_types
/*class _C extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: 
    );
  }
}*/

class _contact extends State<Contacts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(
              context, MaterialPageRoute(builder: (context) => ChatsPage())),
        ),
        title: Text('Search Contacts'),
        actions: <Widget>[
          // ignore: missing_required_param
          IconButton(
            icon: Icon(Icons.search),
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          new InkWell(
            onTap: () {
              print('Add to contact');
            },
            child: Container(
              width: MediaQuery.of(context).devicePixelRatio * double.infinity,
              height: MediaQuery.of(context).devicePixelRatio * 25,
              padding: EdgeInsets.all(10.0),
              child: Row(children: [
                new CircleAvatar(
                  backgroundColor: Colors.green,
                  child: Icon(
                    Icons.contact_phone,
                    color: Colors.white,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                ),
                new Text(
                  'New Contact',
                  style: TextStyle(fontSize: 24.0),
                )
              ]),
            ),
          ),
          new InkWell(
            onTap: () {
              print('Add to group');
            },
            child: Container(
              width: MediaQuery.of(context).devicePixelRatio * double.infinity,
              height: MediaQuery.of(context).devicePixelRatio * 25,
              padding: EdgeInsets.all(10.0),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.green,
                    child: Icon(
                      Icons.group_add,
                      color: Colors.white,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                  ),
                  new Text(
                    'New Group',
                    style: TextStyle(fontSize: 24.0),
                  ),
                ],
              ),
            ),
          ),
          new Expanded(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: CircleAvatar(),
                  title: Text('Number'),
                  subtitle: Text('Status'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
