import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

var refreshKey = GlobalKey<RefreshIndicatorState>();
int limit;
Random random = new Random();

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    limit = random.nextInt(10);
    return Scaffold(
      appBar: AppBar(
        title: Text("Pull To Refresh"),
      ),
      body: RefreshIndicator(
        key: refreshKey,
        onRefresh: refreshList,
        child: ListView(
          children: [
            for (int i = 0; i < limit; i++) Text("Item ${(i)}"),
          ],
        ),
      ),
    );
  }

  Future<void> refreshList() async {
    refreshKey.currentState?.show(atTop: false);
    await Future.delayed(Duration(seconds: 2));
    setState(() {});
    return null;
  }
}
