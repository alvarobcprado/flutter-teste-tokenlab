import 'package:flutter/material.dart';
import 'package:teste_tokenlab/app/controllers/home_controller.dart';

class HomeViewErrorStateWidget extends StatelessWidget {
  const HomeViewErrorStateWidget({Key? key, required this.controller})
      : super(key: key);

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: () {
          controller.start();
        },
        child: Text("Tentar Novamente"),
        style: TextButton.styleFrom(
          primary: Theme.of(context).primaryColor,
          padding: EdgeInsets.all(15),
          side: BorderSide(
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
    );
  }
}
