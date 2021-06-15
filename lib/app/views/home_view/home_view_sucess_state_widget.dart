import 'package:flutter/material.dart';
import 'package:teste_tokenlab/app/controllers/home_controller.dart';

class HomeViewSucessStateWidget extends StatelessWidget {
  const HomeViewSucessStateWidget({Key? key, required this.controller})
      : super(key: key);

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.symmetric(vertical: 15),
      itemCount: controller.moviesList.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisSpacing: 10,
        crossAxisCount: 2,
        mainAxisSpacing: 0,
        childAspectRatio: 2 / 3,
      ),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            print("click");
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
                child: FadeInImage(
                  image: NetworkImage(
                    controller.moviesList[index].posterUrl,
                  ),
                  placeholder: AssetImage('assets/images/placeholder.png'),
                  imageErrorBuilder: (context, error, stackTrace) {
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
                child: Text(
                  controller.moviesList[index].title,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
