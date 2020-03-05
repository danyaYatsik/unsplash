import 'package:flutter/material.dart';
import 'package:galery/util/const.dart';
import 'package:galery/view/ListScreen.dart';
import 'package:galery/view/PhotoScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/",
      routes: {
        ListScreen.ROUTE: (BuildContext context) => ListScreen(),
        PhotoScreen.ROUTE: (BuildContext context) => PhotoScreen(null)
      },
      onGenerateRoute: (routeSettings){
        var path = routeSettings.name.substring(1, routeSettings.name.length);
        var destination = "/" + path.substring(0, path.indexOf("/"));
        var param = path.substring(path.indexOf("/") + 1, path.length);

        if (destination == PhotoScreen.ROUTE) {
          return new MaterialPageRoute(
            builder: (context) => PhotoScreen(param),
            settings: routeSettings,
          );
        }
        return new MaterialPageRoute(
          builder: (context) => ListScreen(),
          settings: routeSettings,
        );
      },
      title: APP_NAME,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}