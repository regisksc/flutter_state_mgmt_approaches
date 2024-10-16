import 'package:get_it/get_it.dart';

class DiAdapter {
  static final DiAdapter? _instance = DiAdapter._();
  static final _di = GetIt.instance;
  DiAdapter._();
  factory DiAdapter() {
    if (_instance == null) return DiAdapter._();
    return _instance!;
  }

  void register<T extends Object>(T Function() instance, {bool singleton = true, bool lazy = true}) {
    if (singleton) {
      return lazy ? _di.registerLazySingleton<T>(instance) : _di.registerSingleton<T>(instance());
    }
    return _di.registerFactory(instance);
  }

  T get<T extends Object>() {
    return _di.get<T>();
  }
}
