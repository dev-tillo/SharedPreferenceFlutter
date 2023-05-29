import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'model/DataModel.dart';

void main() {
  runApp(Home());
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _getData();
  }

  DataModel? dataFromAPI;

  _getData() async {
    try {
      String url = "https://dummyjson.com/products";
      http.Response res = await http.get(Uri.parse(url));
      if (res.statusCode == 200) {
        dataFromAPI = DataModel.fromJson(json.decode(res.body));
        _isLoading = false;
        setState(() {});
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

/* Widget build goes after this */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("REST API Example"),
      ),
      body: SingleChildScrollView(
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.network(
                    dataFromAPI!.products![index].thumbnail!,
                    width: 100,
                  ),
                  Text(dataFromAPI!.products![index].title.toString()),
                  Text("\$${dataFromAPI!.products![index].price.toString()}"),
                ],
              ),
            );
          },
          itemCount: dataFromAPI!.products!.length,
        ),
      ),
    );
  }
}
