import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_market/core/helpers/shared_preferences_keys.dart';
import 'package:fruits_market/features/splash/logic/splash_state.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Injectable()
class SplashCubit extends Cubit<SplashState> {
  final SharedPreferences _sharedPreferencesService;

  SplashCubit(this._sharedPreferencesService) : super(SplashInitial());

  Future<void> checkFirstLaunch() async {
    final isFirstLaunch =
        _sharedPreferencesService.getBool(
          SharedPreferencesKeys.isFirstLaunch,
        ) ??
        true;

    if (isFirstLaunch) {
      emit((SplashOnboarding()));
    } else {
      if (true) {
        emit((SplashLogin()));
      } else {
        emit((SplashHome()));
      }
    }
  }
}
