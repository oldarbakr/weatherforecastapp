import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';

class FavoriteLocationsProvider extends ChangeNotifier {
  List<String> _favoriteLocations = [];

  List<String> get favoriteLocations => _favoriteLocations;

  void addFavoriteLocation(String location) {
    _favoriteLocations.add(location);
    notifyListeners();
  }

  void removeFavoriteLocation(String location) {
    _favoriteLocations.remove(location);
    notifyListeners();
  }

  bool isLocationFavorite(String location) {
    return _favoriteLocations.contains(location);
  }}

class TemperatureUnitProvider extends ChangeNotifier {
  bool _isCelsius = true;

  bool get isCelsius => _isCelsius;

  void toggleTemperatureUnit() {
    _isCelsius = !_isCelsius;
    notifyListeners();
  }
}

