import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

var refreshKey = GlobalKey<RefreshIndicatorState>();
Random random = new Random();
int limit = random.nextInt(10);

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text("Pull to refresh"),
      ),
      body: RefreshIndicator(
        key: refreshKey,
        onRefresh: refreshList,
        child: ListView(
          children: [
            for (int i = 0; i < limit; i++)
              Card(
                elevation: 5,
                child: ListTile(
                  leading: Icon(Icons.radio_button_checked),
                  title: Text("Item ${(i)}"),
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Future<void> refreshList() async {
    refreshKey.currentState?.show(atTop: false);
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      limit = random.nextInt(10);
    });
  }
}
