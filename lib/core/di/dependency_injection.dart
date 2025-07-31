import 'package:fruits_market/core/di/dependency_injection.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';


final getIt = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies() async {
  await getIt.init();
}

