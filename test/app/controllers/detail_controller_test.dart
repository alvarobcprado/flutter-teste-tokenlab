import 'package:flutter_test/flutter_test.dart';
import 'package:teste_tokenlab/app/controllers/detail_controller.dart';

main() {
  final ctrl = DetailController();
  test("Deve retornar um movie detail model", () async {
    await ctrl.start(238);
    expect(ctrl.movieDetail!.popularity, 26.283);
  });
}
