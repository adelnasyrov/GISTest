import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/planet_model.dart';

class AddPlanet extends StatefulWidget {
  const AddPlanet({super.key});

  @override
  State<AddPlanet> createState() => _AddPlanetState();
}

class _AddPlanetState extends State<AddPlanet> {
  final TextEditingController radiusController = TextEditingController();
  final TextEditingController colorController = TextEditingController();
  final TextEditingController distanceController = TextEditingController();
  final TextEditingController speedController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    radiusController.dispose();
    colorController.dispose();
    distanceController.dispose();
    speedController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: radiusController,
                decoration: InputDecoration(hintText: "Radius (double)"),
              ),
              TextField(
                controller: colorController,
                decoration: InputDecoration(hintText: "Color (int)"),
              ),
              TextField(
                controller: distanceController,
                decoration: InputDecoration(hintText: "Distance (double)"),
              ),
              TextField(
                controller: speedController,
                decoration: InputDecoration(hintText: "Speed (double)"),
              ),
              ElevatedButton(
                onPressed: () {
                  final double radius = double.parse(radiusController.text);
                  final int color = int.parse(colorController.text);
                  final double distance = double.parse(distanceController.text);
                  final double speed = double.parse(speedController.text);

                  final newPlanet = PlanetModel()
                    ..planetRadius = radius
                    ..planetColor = color
                    ..planetDistance = distance
                    ..planetSpeed = speed;
                  Navigator.of(context).pop(newPlanet);// Close the "Add Planet" screen
                },
                child: Text("Proceed"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
