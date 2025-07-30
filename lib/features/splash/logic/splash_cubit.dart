import 'package:bloc/bloc.dart';
import 'package:fruits_market/core/helpers/shared_preferences_keys.dart';
import 'package:fruits_market/features/splash/logic/splash_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashCubit extends Cubit<SplashState> {
  final SharedPreferences _sharedPreferencesService;

  SplashCubit(this._sharedPreferencesService) : super(SplashInitial());

  Future<void> checkFirstLaunch() async {
    final isFirstLaunch = _sharedPreferencesService.getBool(SharedPreferencesKeys.isFirstLaunch) ?? true;

    if (isFirstLaunch) {
      emit(SplashOnboarding());
    } else {
      emit((SplashLogin()));
    }
  }
}
