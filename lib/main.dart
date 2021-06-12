import 'package:flutter/material.dart';

import 'app/views/details_view.dart';
import 'app/views/home_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => HomeView(),
        '/details': (context) => DetailsView(),
      },
    );
  }
}
