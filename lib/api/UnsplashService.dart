import 'dart:convert';
import 'package:galery/model/Photo.dart';
import 'package:galery/util/const.dart';
import 'package:http/http.dart' as http;

class UnsplashService {

  Future<List<Photo>> loadPhotos() async {
    var response = await http
        .get(BASE_URL, headers: {"Authorization": "Client-ID $CLIENT_ID"});
    if (response.statusCode == 200) {
      return json.decode(response.body).map((value) {
        return Photo(
          author: value['user']['name'],
          description: value['alt_description'],
          imageSmall: value['urls']['small'],
          imageLarge: value['urls']['full']
        );
      }).toList().cast<Photo>();
    } else {
      throw Exception('Failed to load photos');
    }
  }
}
