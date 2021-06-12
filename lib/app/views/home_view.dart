import 'package:flutter/material.dart';
import 'package:teste_tokenlab/app/controllers/home_controller.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  HomeController controller = HomeController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Teste Tokenlab'),
      ),
      body: GridView.builder(
        itemCount: 10,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 15,
          crossAxisCount: 2,
          mainAxisSpacing: 15,
          mainAxisExtent: 250,
        ),
        itemBuilder: (context, index) {
          return Container(
            child: Image.network(
              "https://static.imasters.com.br/wp-content/uploads/2015/05/Figura2_api.jpg",
            ),
          );
        },
      ),
    );
  }
}
