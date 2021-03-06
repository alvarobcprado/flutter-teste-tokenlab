import 'package:flutter/material.dart';

import 'app/views/detail_view/detail_view.dart';
import 'app/views/home_view/home_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => HomeView(),
        '/details': (context) => DetailsView(),
      },
    );
  }
}
