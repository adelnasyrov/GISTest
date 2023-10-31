import 'package:flutter/material.dart';
import 'package:gis_test/view/addplanet.dart';
import 'package:gis_test/view/rotation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        '/': (context) => const SolarSystemAnimation(),
        '/add_planet': (context) => const AddPlanet(),
      },
      initialRoute: "/",
    );
  }
}

