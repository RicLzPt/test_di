import 'package:flutter/material.dart';
import 'package:netapi/photo_repository.dart';
import 'package:http/http.dart' as http;

import 'my_home_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Isolate Demo';

    return MaterialApp(
      title: appTitle,
      home: MyHomePage(
        title: appTitle,
        photoRepository: PhotoRepository(
          con: http.Client(),
        ),
      ),
    );
  }
}
