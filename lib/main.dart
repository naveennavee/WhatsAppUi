import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'ChatPage.dart' as chatPage;
import './StatusPage.dart' as statusPage;
import 'CallsPage.dart' as callsPage;
import 'CamerasPage.dart' as CameraPage;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Splash2(),
    );
  }
}

class Splash2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 4,
      navigateAfterSeconds: new MyHomePage(),
      title: new Text(
        'WhatsApp',
        textScaleFactor: 2,
      ),
      loadingText: Text("Loading"),
      photoSize: 100.0,
      loaderColor: Colors.blue,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

enum list {
  Delete,
  StatusPrivacy,
  NewGroup,
  NewBroadcast,
  Payments,
  Settings,
  Starred_message
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  TabController controller;
  int _curntIndex = 0;
  Icon ser = Icon(Icons.search);
  Icon m = Icon(Icons.more_vert);
  // ignore: non_constant_identifier_names
  Widget APPBAR = Text(
    'WhatsApp',
    style: TextStyle(fontSize: 30.0),
  );
  @override
  void initState() {
    super.initState();
    controller = new TabController(length: 4, vsync: this);
    controller.addListener(_handlePopUp);
  }

  void _handlePopUp() {
    setState(() {
      //print(controller.index);
      _curntIndex = controller.index;
      if (controller.index == 1) {
        print(controller.index);
        PopupMenuButton(
            onSelected: (list result) {
              print(result);
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<list>>[
                  const PopupMenuItem<list>(
                    value: list.NewGroup,
                    child: Text('NewGroup'),
                  ),
                  const PopupMenuItem<list>(
                    value: list.Payments,
                    child: Text('Payment'),
                  ),
                  const PopupMenuItem<list>(
                    value: list.Settings,
                    child: Text('Settings'),
                  ),
                  const PopupMenuItem<list>(
                    value: list.Starred_message,
                    child: Text('Starred Message'),
                  ),
                  const PopupMenuItem<list>(
                    value: list.NewBroadcast,
                    child: Text('NewBroadcast'),
                  )
                ]);
      } else if (controller.index == 2) {
        PopupMenuButton(
            onSelected: (list result) {
              print(result);
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<list>>[
                  const PopupMenuItem<list>(
                    value: list.NewGroup,
                    child: Text('NewGroup'),
                  ),
                  const PopupMenuItem<list>(
                    value: list.Payments,
                    child: Text('Payment'),
                  ),
                ]);
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
          title: APPBAR,
          backgroundColor: Colors.green[900],
          actions: [
            IconButton(
                onPressed: () {
                  setState(() {
                    if (this.ser.icon == Icons.search) {
                      this.ser = Icon(Icons.cancel);
                      this.APPBAR = TextField(
                        textInputAction: TextInputAction.go,
                        style: TextStyle(color: Colors.white, fontSize: 24.0),
                      );
                    } else {
                      this.APPBAR = Text(
                        'WhatsApp',
                        style: TextStyle(fontSize: 30.0),
                      );
                      this.ser = Icon(Icons.search);
                    }
                  });
                },
                iconSize: 32.0,
                icon: ser),
            //if (this.controller == 1)
            IconButton(icon: Icon(Icons.more_vert), onPressed: _handlePopUp)
          ],
          bottom: TabBar(controller: controller, tabs: <Widget>[
            new Tab(
              icon: Icon(Icons.camera_alt),
            ),
            new Tab(
              text: 'Chats',
            ),
            new Tab(
              text: 'Status',
            ),
            new Tab(
              text: 'Calls',
            ),
          ])),
      body: TabBarView(controller: controller, children: <Widget>[
        new CameraPage.CamerasPage(),
        new chatPage.ChatsPage(),
        new statusPage.StatusPage(),
        new callsPage.CallsPage(),
      ]),
    ));
  }
}
