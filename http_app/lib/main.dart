import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Node Js demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          appBar: AppBar(title: const Text('Flutter client with node backend')),
          body: const HomePage(),
        ));
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String serverResponse = 'Server response:';
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Align(
          alignment: Alignment.center,
          child: SizedBox(
            width: 200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  child: const Text('Make a get request to the server'),
                  onPressed: () {
                    _makeGetRequest();
                  },
                ),
                Padding(padding: const EdgeInsets.all(8.0), child: Text(serverResponse)),
              ],
            ),
          )),
    );
  }

  _makeGetRequest() async {
    final url = Uri.parse(_localhost());
    Response response = await get(url);
    setState(() {
      serverResponse = response.body;
    });
  }

  String _localhost() {
    if (Platform.isAndroid) {
      return 'http://10.0.2.2:3000';
    }
    else {
      return 'http://localhost:3000';
    }
  }
}
