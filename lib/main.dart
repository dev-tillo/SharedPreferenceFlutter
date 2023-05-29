import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// void main() {
//   runApp(SharedHome());
// }

class SharedHome extends StatefulWidget {

  @override
  _SharedHomeState createState() => _SharedHomeState();
}

class _SharedHomeState extends State<SharedHome> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "SharedPreferences",
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    _loadCounter();
  }

// Loading counter value on start
  void _loadCounter() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter = (prefs.getInt('counter') ?? 0);
    });
  }

// Incrementing counter after click
  void _incrementCounter() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter = (prefs.getInt('counter') ?? 0) + 1;
      prefs.setInt('counter', _counter);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Shared Preferences")),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes
      // auto-formatting nicer for build methods.
    );
  }
}

//set data
//SharedPreferences pre = await SharedPreferences.getInstance();
// pre.setString("name", "FlutterCampus"); //save string
// pre.setInt("age", 25); //save integer
// pre.setBool("married", false); //save boolean
// pre.setDouble("price", 240.50); //save double
// pre.setStringList("tags", ["Flutter", "Dart", "App"]); //save List

//get data

//SharedPreferences pre = await SharedPreferences.getInstance();
// String name = pre.getString("name") ?? "";
// //here "??" is a fallback operator,
// //if the return is null, it will be the assigned value;
//
// int age = pre.getInt("age") ?? 0;
// bool married = pre.getBool("married") ?? false;
// double price = pre.getDouble("price") ?? 0.00;
// List<String> tags = pre.getStringList("tags") ?? [];

//import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// void main(){
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget{
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Home(),
//     );
//   }
// }
//
// class Home extends StatefulWidget{
//   @override
//   _HomeState createState() => _HomeState();
// }
//
// class _HomeState extends State<Home> {
//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
//           body: Container(
//             padding: EdgeInsets.only(top:80, left:20, right:20),
//             child: Wrap(
//                 alignment: WrapAlignment.start,
//                 children: [
//
//                    ElevatedButton(
//                     onPressed: () async {
//                         SharedPreferences pre = await SharedPreferences.getInstance();
//                         pre.setString("name", "FlutterCampus"); //save string
//                         pre.setInt("age", 25); //save integer
//                         pre.setBool("married", false); //save boolean
//                         pre.setDouble("price", 240.50); //save double
//                         pre.setStringList("tags", ["Flutter", "Dart", "App"]); //save List
//                     },
//                     child: Text("Save Data")
//                   ),
//
//
//                   ElevatedButton(
//                     onPressed: () async {
//                        SharedPreferences pre = await SharedPreferences.getInstance();
//                        String name = pre.getString("name") ?? "";
//                        //here "??" is a fallback operator,
//                        //if the return is null, it will be the assigned value;
//
//                        int age = pre.getInt("age") ?? 0;
//                        bool married = pre.getBool("married") ?? false;
//                        double price = pre.getDouble("price") ?? 0.00;
//                        List<String> tags = pre.getStringList("tags") ?? [];
//                     },
//                     child: Text("Get Data")
//                   )
//             ],)
//           )
//        );
//   }
// }