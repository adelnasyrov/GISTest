import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gis_test/model/planet_model.dart';

class SolarSystemPainter extends CustomPainter {
  final List<PlanetModel> planets;

  SolarSystemPainter(this.planets);

  @override
  void paint(Canvas canvas, Size size) {
    // Calculate positions and draw the sun
    const sunRadius = 20.0;
    final sunCenter = Offset(size.width / 2, size.height / 2);
    canvas.drawCircle(sunCenter, sunRadius, Paint()
      ..color = Colors.yellow);

    // Draw the planets based on their rotations
    for (int i = 0; i < planets.length; i++) {
      final rotation = planets[i].rotation;
      final planetRadius = planets[i].planetRadius;
      final planetDistance = planets[i].planetDistance + sunRadius; // Adjust distance for each planet
      final planetAngle = 2 * 3.14 * rotation;

      final planetCenter = Offset(
        sunCenter.dx + planetDistance * cos(planetAngle),
        sunCenter.dy + planetDistance * sin(planetAngle),
      );

      final planetColor = Color(planets[i].planetColor);

      canvas.drawCircle(planetCenter, planetRadius, Paint()
        ..color = planetColor);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}