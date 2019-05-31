import 'package:get_it/get_it.dart';
import 'package:storyteller/core/viewmodels/home_model.dart';

GetIt locator = GetIt();

void locatorSetup() {
  locator.registerLazySingleton(() => HomeModel());
}
