import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PhotoScreen extends StatelessWidget {

  static const ROUTE = "/photo";

  String img;

  PhotoScreen(String img) {
    if (img == null) {
      this.img = "https://via.placeholder.com/468x720?text=Wrong+image+URL";
    } else {
      this.img = img;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Photo"),
      ),
      body: Center(
        child: Image.network(img,fit: BoxFit.cover,
          loadingBuilder:(BuildContext context, Widget child,ImageChunkEvent loadingProgress) {
            if (loadingProgress == null) return child;
            return Center(
              child: CircularProgressIndicator(
                value: loadingProgress.expectedTotalBytes != null ?
                loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes
                    : null,
              ),
            );
          },
        ),
      )
    );
  }
}
