import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/weather_model.dart';
import '../../services/weather_service.dart';
import 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit(this.weatherService) : super(IntialWeather());

  WeatherService weatherService;
  String? cityName;
  WeatherModel? weatherModel;
  void getWeather({required String cityName}) async {
    emit(LoadingWeather());
    try {
      weatherModel = await weatherService.getWeather(cityName: cityName);
      emit(SucssesWeather());
    } on Exception catch (e) {
      emit(FailureWeather());
    }
  }
}
