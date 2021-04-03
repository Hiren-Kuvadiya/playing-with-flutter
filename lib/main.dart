import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app/SecondScreen.dart';
import 'package:flutter_app/StreamUtil.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        "/secondRoute": (context) => SecondScreen()
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }

}

class MyHomePage extends StatefulWidget {

  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();

}

class _MyHomePageState extends State<MyHomePage> {

  List<String> mList;

  TextEditingController editTextController = new TextEditingController();


  setStream(){
    Stream stream = StreamUtil.streamController.stream;

    stream.listen((event) {
      print("ADDED_EVENT: $event");

      setState(() {
      mList.add(event);
      });

    });
  }

  generateList() {
    mList = List<String>();
    for (var i = 0; i < 10; i++) {
      mList.add("Item $i");
    }
  }

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

  @override
  void initState() {
    super.initState();
    generateList();
    setStream();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(

          child: ListView.builder(
            itemCount: mList.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  goToSecondScreen(index);

                  //  Navigator.pushNamed(context,'/secondRoute',arguments: mList[index]);
                },
                child: new Card(
                  child: new Text(mList[index]),
                ),
              );
            },)

      ),

      floatingActionButton: FloatingActionButton(
        onPressed: showTheDialog,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }


  void goToSecondScreen(int index) async {
    Map<String, dynamic> map = {
      "index": index,
      "list": mList,
    };

    var result = await Navigator.pushNamed(context, '/secondRoute', arguments: map);

    // var result = await Navigator.push(context, MaterialPageRoute(builder: (context) => SecondScreen(receivedMap: map)));

    print("ON_BACK_PRESS: $result");
    setState(() {

    });

    //  Scaffold.of(context).showSnackBar(SnackBar(content: Text("$result"),duration: Duration(seconds: 3),));
  }

}
