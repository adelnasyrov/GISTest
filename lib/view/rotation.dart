import 'dart:math';

import 'package:flutter/animation.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gis_test/model/planet_model.dart';

import '../controller/paint_controller.dart';

class SolarSystemAnimation extends StatefulWidget {
  const SolarSystemAnimation({super.key});

  @override
  _SolarSystemAnimationState createState() => _SolarSystemAnimationState();
}

class _SolarSystemAnimationState extends State<SolarSystemAnimation>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  List<PlanetModel> planets = [];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10), // Adjust the duration as needed
    )..repeat();

    _controller.addListener(() {
      setState(() {
        print(planets.length);
        for (final planet in planets) {
          planet.rotation += planet.planetSpeed;
        }
      });
    });
  }

  void addPlanet() {
    Navigator.pushNamed(context, '/add_planet').then((newPlanet) {
      if (newPlanet != null) {
        setState(() {
          planets.add(newPlanet as PlanetModel);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          CustomPaint(
            size: MediaQuery
                .of(context)
                .size,
            painter: SolarSystemPainter(planets),
          ),

          Align(
            alignment: Alignment.bottomRight,
            child: FloatingActionButton(
              onPressed: () {
                setState(() {
                  addPlanet();
                });
              },
              child: const Icon(Icons.add),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}




