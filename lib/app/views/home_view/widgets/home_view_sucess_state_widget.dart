import 'package:flutter/material.dart';
import 'package:teste_tokenlab/app/controllers/home_controller.dart';

///Widget para ser exibido quando a requisição da homeView for bem sucedida
class HomeViewSucessStateWidget extends StatelessWidget {
  const HomeViewSucessStateWidget({Key? key, required this.controller})
      : super(key: key);

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.symmetric(
        vertical: 15,
        horizontal: 10,
      ),
      itemCount: controller.moviesList.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisSpacing: 10,
        crossAxisCount: 2,
        mainAxisSpacing: 5,
        childAspectRatio: 2 / 3,
      ),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(
              context,
              "/details",
              arguments: controller.moviesList[index],
            );
          },
          child: Column(
            children: [
              Expanded(
                flex: 10,
                child: Image.network(
                  controller.moviesList[index].posterUrl,
                  errorBuilder: (BuildContext context, Object exception,
                      StackTrace? stackTrace) {
                    return Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.asset(
                          "assets/images/placeholder.png",
                        ),
                        Icon(Icons.warning),
                      ],
                    );
                  },
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  alignment: Alignment.topCenter,
                  child: Text(
                    controller.moviesList[index].title,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
