import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:galery/view/PhotoList.dart';

class ListScreen extends StatelessWidget {

  static const ROUTE = "/";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Photos"),
        ),
        body: PhotoList());
  }
}
