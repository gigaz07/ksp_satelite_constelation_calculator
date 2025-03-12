import 'package:flutter/material.dart';
import 'package:ksp_satelite_constelation_calculator/core/utils/responsive.dart';
import 'package:ksp_satelite_constelation_calculator/views/satelite_deployment_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    Responsive.init(context);
    return MaterialApp(
      theme: ThemeData(
      ),
      home: SatelliteDeploymentScreen()
    );
  }
}
