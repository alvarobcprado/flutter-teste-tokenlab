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
  void initState() {
    super.initState();
    controller.start();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Teste Tokenlab'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 15,
          crossAxisCount: 2,
          mainAxisSpacing: 15,
          mainAxisExtent: 300,
        ),
        itemBuilder: (context, index) {
          return Container(
            child: Image.network(
              'https://pub.dev/static/img/ff-banner-desktop-2x.png?hash=48nbn83rjrlg52rnkp4lq1npafu8jsve',
            ),
          );
        },
      ),
    );
  }
}
