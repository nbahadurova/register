import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../data/contracts/auth_contract.dart';
import 'package:register/data/repositories/auth_repository.dart';
import 'package:register/data/services/remote/register_service.dart';
import 'package:register/data/services/local/register__local_service.dart';

final GetIt locator = GetIt.instance;

Future<void> init() async {
  await Hive.initFlutter();
}

Future<void> setupLocator() async {
  locator.registerLazySingleton(() => RegisterService());
  locator.registerLazySingleton<AuthContract>(() => AuthRepository(locator()));
  final Box<String> box = await Hive.openBox('registerBox');
  // locator
  //     .registerLazySingleton<RegisterLocalService>(() => RegisterLocalService(box));

  // locator.registerLazySingleton(() => CategoryService());
  // locator.registerLazySingleton<CategoryContract>(
  //     () => CategoryRepository(locator()));

  // locator.registerLazySingleton(() => ProductService());
  // locator.registerLazySingleton<ProductContract>(
  //     () => ProductRepository(locator()));
}
