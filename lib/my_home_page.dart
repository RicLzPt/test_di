import 'package:flutter/material.dart';
import 'package:netapi/Interfaces/i_photo_repository.dart';
import 'package:netapi/photo_repository.dart';

import 'photo.dart';
import 'photo_list.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title, required this.photoRepository}) : super(key: key);

  final String title;
  final IPhotoRepository photoRepository;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: FutureBuilder<List<Photo>>(
        future: photoRepository.fetchPhotos(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('An error has occurred!'),
            );
          } else if (snapshot.hasData) {
            return PhotosList(photos: snapshot.data!);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}