import 'package:flutter/material.dart';

class MyTesingWidget extends StatefulWidget {
  const MyTesingWidget({Key key}) : super(key: key);

  @override
  _MyTesingWidgetState createState() => _MyTesingWidgetState();
}

class _MyTesingWidgetState extends State<MyTesingWidget> {
  List<String> mList;
  String value;
  Map<String, dynamic> receivedMap;
  int mIndex;

  @override
  Widget build(BuildContext context) {

    Map<String, dynamic> arguments = new Map<String, dynamic>.from(
        ModalRoute.of(context).settings.arguments);

    mList = arguments["list"];
    mIndex = arguments["index"];

    print("SENT_VALUE $receivedMap");
    print("SENT_VALUE1 $arguments");
    print("SENT_INDEX $mIndex");
    print("SENT_LIST $mList");

    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text("My Custom Widget Screen"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                height: size.height,
                child: Text(
                  "SIGNUP",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
