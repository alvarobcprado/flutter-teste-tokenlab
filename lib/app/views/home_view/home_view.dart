import 'package:flutter/material.dart';
import 'package:teste_tokenlab/app/controllers/home_controller.dart';
import 'package:teste_tokenlab/app/views/home_view/widgets/home_view_error_state.dart';
import 'package:teste_tokenlab/app/views/home_view/widgets/home_view_sucess_state_widget.dart';

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

  ///Gerenciador local de exibição de widgets de acordo com o estado da requisição
  Widget manageState(HomeState state) {
    switch (state) {
      case HomeState.starting:
        return Container();

      case HomeState.loading:
        return Center(
          child: CircularProgressIndicator(),
        );

      case HomeState.error:
        return HomeViewErrorStateWidget(controller: controller);

      case HomeState.succesful:
        return HomeViewSucessStateWidget(controller: controller);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tokenlab Filmes'),
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
