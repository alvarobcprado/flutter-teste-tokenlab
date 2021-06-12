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

  manageState(HomeState state) {
    switch (state) {
      case HomeState.starting:
        return Container();
      case HomeState.loading:
        return Center(
          child: CircularProgressIndicator(),
        );
      case HomeState.error:
        return Center(
          child: TextButton(
            onPressed: () {
              controller.start();
            },
            child: Text("Tentar Novamente"),
          ),
        );
      case HomeState.succesful:
        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 15,
            crossAxisCount: 2,
            mainAxisSpacing: 15,
            mainAxisExtent: 300,
          ),
          itemBuilder: (context, index) {
            return Container(
              child: Image.network(controller.moviesList[index].posterUrl),
            );
          },
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Teste Tokenlab'),
      ),
      body: ValueListenableBuilder<HomeState>(
        valueListenable: controller.state,
        builder: (BuildContext context, HomeState state, _) {
          return manageState(controller.state.value);
        },
      ),
    );
  }
}
