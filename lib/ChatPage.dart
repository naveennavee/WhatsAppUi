import './Contacts.dart' as ContactsPage;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import './PrivateChat.dart' as pc;

enum list { NewGroup, NewBroadcast, Payments, Settings, Starred_message }

class ChatsPage extends StatefulWidget {
  @override
  _ChattingPage createState() => _ChattingPage();
}

class _ChattingPage extends State<ChatsPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Container(
            child: Center(
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: <Widget>[
                        ListTile(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => pc.ChatScreen())),
                          leading: CircleAvatar(
                            child: Icon(Icons.person),
                          ),
                          title: Text('Name'),
                          subtitle: Text('Message'),
                        ),
                        Divider(color: Colors.black),
                      ],
                    );
                  }),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.green,
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ContactsPage.Contacts()));
            },
            child: Icon(Icons.message),
          )),
    );
  }
}
