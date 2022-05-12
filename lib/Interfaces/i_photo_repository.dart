import 'dart:core';

import 'package:netapi/photo.dart';

abstract class IPhotoRepository {
  Future<List<Photo>> fetchPhotos();

  List parsePhotos(String json);
}
