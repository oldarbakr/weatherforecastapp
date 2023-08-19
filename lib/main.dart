import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

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
}

class TemperatureUnitProvider extends ChangeNotifier {
  bool _isCelsius = true;

  bool get isCelsius => _isCelsius;

  void toggleTemperatureUnit() {
    _isCelsius = !_isCelsius;
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FavoriteLocationsProvider()),
        ChangeNotifierProvider(create: (_) => TemperatureUnitProvider()),
      ],
      child: MaterialApp(
        title: 'Weather App',
        home: HomeScreen(),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather Forecast'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Current Weather'),
            ElevatedButton(
              onPressed: () {
                _navigateToForecastScreen(context);
              },
              child: Text('View Forecast'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SearchScreen()),
          );
        },
        child: Icon(Icons.search),
      ),
    );
  }

  void _navigateToForecastScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ForecastScreen()),
    );
  }
}

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search City'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Search for a city'),
            // Implement search functionality here
          ],
        ),
      ),
    );
  }
}

class ForecastScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('5-Day Forecast'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('5-Day Forecast'),
            // Display forecast data here
          ],
        ),
      ),
    );
  }
}
