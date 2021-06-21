import 'package:flutter/material.dart';
import 'package:teste_tokenlab/app/controllers/home_controller.dart';

///Widget para ser exibido quando ocorrer algum erro na requisição da homeView
class HomeViewErrorStateWidget extends StatelessWidget {
  const HomeViewErrorStateWidget({Key? key, required this.controller})
      : super(key: key);

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Algo inesperado aconteceu x.x",
            style: TextStyle(
              color: Colors.red,
            ),
          ),
          SizedBox(height: 15),
          TextButton(
            onPressed: () {
              controller.start();
            },
            child: Text("Tentar Novamente"),
            style: TextButton.styleFrom(
              primary: Colors.red,
              padding: EdgeInsets.all(15),
              side: BorderSide(
                color: Colors.red,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
