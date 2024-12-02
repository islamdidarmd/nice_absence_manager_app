import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:nice_absence_manager_app/di/injection.config.dart';

final di = GetIt.instance;

@InjectableInit(
  initializerName: 'init',
)
void configureDependencies() => di.init();
