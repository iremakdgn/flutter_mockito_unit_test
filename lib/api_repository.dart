import 'dart:convert';

import 'package:flutter_mockito_unit_test/album_dto.dart';
import 'package:http/http.dart' as http;

class ApiRepository {
  Future<AlbumDto> fetchAlbum() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));

    if (response.statusCode == 200) {
      return AlbumDto.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load album');
    }
  }
}
