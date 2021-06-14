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
            style: TextButton.styleFrom(
              primary: Theme.of(context).primaryColor,
              padding: EdgeInsets.all(15),
              side: BorderSide(
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
        );

      case HomeState.succesful:
        return GridView.builder(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          itemCount: controller.moviesList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 10,
            crossAxisCount: 2,
            mainAxisSpacing: 20,
            childAspectRatio: 2 / 3,
          ),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                print("click");
                Navigator.pushNamed(
                  context,
                  "/details",
                  arguments: controller.moviesList[index].id,
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
                            Icon(Icons.error),
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
