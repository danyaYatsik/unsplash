import 'package:flutter/material.dart';
import 'package:galery/api/UnsplashService.dart';
import 'package:galery/model/Photo.dart';
import 'package:galery/view/PhotoScreen.dart';

class PhotoList extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
      return PhotoListState();
  }
}

class PhotoListState extends State<PhotoList> {

  bool _isLoaded = false;
  List<ListTile> _data = [];

  @override
  void initState() {
    super.initState();
    try {
      UnsplashService().loadPhotos().then((List<Photo> value) =>
          _setData(value));
    } catch (e) {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text(e.toString()),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoaded) {
      return ListView(
        children: _data
      );
    } else {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
  }

  _setData(List<Photo> value) {
    _isLoaded = true;
    setState(() {
      _data = value.map((e) {
        return ListTile(
          title: Text(e.description),
          subtitle: Text(e.author),
          leading: Image.network(e.imageSmall),
          onTap: () =>
              Navigator.pushNamed(
                  context, "${PhotoScreen.ROUTE}/${e.imageLarge}"),
        );
      }).toList();
    });
  }
}