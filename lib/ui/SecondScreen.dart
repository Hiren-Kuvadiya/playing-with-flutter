import 'package:flutter/material.dart';
import 'package:flutter_app/ui/main.dart';
import 'package:flutter_app/utils/StreamUtil.dart';

class SecondScreen extends StatelessWidget {
  String value;
  Map<String, dynamic> receivedMap;
  int mIndex;

  TextEditingController mEditTextController = new TextEditingController();
  TextEditingController editTextController = new TextEditingController();

  SecondScreen({this.receivedMap});

  List<String> mList;

  @override
  Widget build(BuildContext context) {
    // value =   ModalRoute.of(context).settings.arguments;

    Map<String, dynamic> arguments = new Map<String, dynamic>.from(
        ModalRoute.of(context).settings.arguments);

    mList = arguments["list"];
    mIndex = arguments["index"];

    print("SENT_VALUE $receivedMap");
    print("SENT_VALUE1 $arguments");
    print("SENT_INDEX $mIndex");
    print("SENT_LIST $mList");

    showTheDialog() {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              scrollable: true,
              title: Text('Enter something'),
              content: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        controller: editTextController,
                        decoration: InputDecoration(
                          labelText: 'Enter text',
                          icon: Icon(Icons.account_box),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              actions: [
                RaisedButton(
                    child: Text("Submit"),
                    onPressed: () {
                      // your code

                      Navigator.pop(context);

                      //setState(() { mList.add(editTextController.text);});

                      StreamUtil.streamController.add(editTextController.text);

                      editTextController.text = "";
                    })
              ],
            );
          });
    }

    return Scaffold(
        appBar: AppBar(
          title: Text("Second Screen"),
        ),
        body: Column(
          children: [
            Center(
                child: TextField(
              controller: mEditTextController,
              decoration: InputDecoration(labelText: mList[mIndex]),
            )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RaisedButton(
                  onPressed: () {
                    mList.removeAt(mIndex);
                    Navigator.pop(context, mList);
                  },
                  child: Text("Delete"),
                ),
                RaisedButton(
                  onPressed: () {
                    mList[mIndex] = mEditTextController.text;
                    Navigator.pop(context, mList);
                  },
                  child: Text("update"),
                ),
                RaisedButton(
                  onPressed: () {
                    showTheDialog();
                  },
                  child: Text("add"),
                )
              ],
            )
          ],
        ));
  }
}
