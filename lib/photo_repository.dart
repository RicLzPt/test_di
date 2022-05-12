import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:http/http.dart' as http;
import 'package:netapi/Interfaces/i_photo_repository.dart';

import 'photo.dart';

class PhotoRepository implements IPhotoRepository {
  const PhotoRepository({required this.con});

  final http.Client con;

  @override
  Future<List<Photo>> fetchPhotos() async {
    final response = await con
        .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));

    // Use the compute function to run parsePhotos in a separate isolate.
    // return compute(parsePhotos, response.body);
    return parsePhotos(response.body);
  }

// A function that converts a response body into a List<Photo>.
  @override
  List<Photo> parsePhotos(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

    return parsed.map<Photo>((json) => Photo.fromJson(json)).toList();
  }
}
