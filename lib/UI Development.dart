import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'State Management.dart';

void main() => runApp(MyApp());

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
            // Display weather information here
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to the search screen
        },
        child: Icon(Icons.search),
      ),
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
            // You can use ListView.builder or other widgets to show forecast details
          ],
        ),
      ),
    );
  }
}

class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final favoriteLocations = Provider.of<FavoriteLocationsProvider>(context).favoriteLocations;

    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Locations'),
      ),
      body: ListView.builder(
        itemCount: favoriteLocations.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(favoriteLocations[index]),
            // Implement functionality to display weather for each favorite location
          );
        },
      ),
    );
  }
}

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isCelsius = Provider.of<TemperatureUnitProvider>(context).isCelsius;

    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SwitchListTile(
              title: Text('Temperature in Celsius'),
              value: isCelsius,
              onChanged: (newValue) {
                Provider.of<TemperatureUnitProvider>(context, listen: false).toggleTemperatureUnit();
              },
            ),
          ],
        ),
      ),floatingActionButton: FloatingActionButton(
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
}


