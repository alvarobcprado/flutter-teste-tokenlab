import 'package:flutter/material.dart';

///Widget para ser exibido quando ocorrer algum erro na requisição da homeView
class ErrorStateViewWidget extends StatelessWidget {
  const ErrorStateViewWidget({Key? key, required this.func}) : super(key: key);

  final Function() func;

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
            onPressed: func,
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
