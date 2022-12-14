import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  var suggestionTextFieldControler = new TextEditingController();
  GlobalKey<AutoCompleteTextFieldState<String>> key = GlobalKey();

  List suggetionList = ['Rahul', 'devika', 'robert', 'roy'];

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AutoCompleteTextField(
              clearOnSubmit: false,
              key: key,
              controller: suggestionTextFieldControler,
              suggestions: suggetionList,
              style: TextStyle(color: Colors.black, fontSize: 18),
              decoration: InputDecoration(
                  fillColor: Color.fromARGB(255, 239, 8, 8),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  )),
              itemFilter: (item, query) {
                String it = item as String;
                return it.toLowerCase().startsWith(query.toLowerCase());
              },
              itemSorter: (a, b) {
                String c = a as String;
                String d = b as String;
                return c.compareTo(d);
              },
              itemSubmitted: (item) {
                suggestionTextFieldControler.text = item as String;
              },
              itemBuilder: (context, item) {
                return Container(
                  child: Row(children: [
                    Text(
                      item as String,
                      style: TextStyle(fontSize: 12),
                    ),
                  ]),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
