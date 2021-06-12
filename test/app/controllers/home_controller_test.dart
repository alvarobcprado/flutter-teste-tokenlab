import 'package:flutter_test/flutter_test.dart';
import 'package:teste_tokenlab/app/controllers/home_controller.dart';

main() {
  final ctrl = HomeController();
  test("Deve retornar uma lista de movies Model", () async {
    await ctrl.start();
    expect(ctrl.moviesList.length, 20);
  });
}
