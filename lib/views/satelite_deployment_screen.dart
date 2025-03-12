import 'package:flutter/material.dart';
import 'package:ksp_satelite_constelation_calculator/core/theme/app_theme.dart';
import 'package:ksp_satelite_constelation_calculator/widgets/number_input.dart';
import 'package:ksp_satelite_constelation_calculator/widgets/toggle_button.dart';

class SatelliteDeploymentScreen extends StatefulWidget {
  SatelliteDeploymentScreen({super.key});

  @override
  State<SatelliteDeploymentScreen> createState() => _SatelliteDeploymentScreenState();
}

class _SatelliteDeploymentScreenState extends State<SatelliteDeploymentScreen> {
  final TextEditingController _apoapsisHeightController = TextEditingController();
  final TextEditingController _periapsisHeightController = TextEditingController();
  final TextEditingController _sateliteNumberController = TextEditingController();
  final TextEditingController _orbitNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: AppColors.backgroundColor,
        child: Padding(
          padding: EdgeInsets.only(top: 40, left: 12, right: 12, bottom: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: AppColors.primaryColor,
                    ),
                    height: 60,
                  ),
                  SizedBox(height: 12),
                  Row(
                    children: [
                      ToggleButton(title: 'MSO'),
                      SizedBox(width: 12),
                      ToggleButton(title: 'SAT'),
                      SizedBox(width: 12),
                      ToggleButton(title: 'COM'),
                      SizedBox(width: 12),
                      ToggleButton(title: 'TAG'),
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: AppColors.primaryColor,
                    ),
                    height: 202,
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Apoapsis height:',
                                  style: TextStyle(
                                    color: AppColors.lightTextColor,
                                    fontSize: 14,
                                  ),
                                ),
                                SizedBox(height: 6),
                                NumberInput(controller: _apoapsisHeightController),
                                SizedBox(height: 6),
                                Text(
                                  'Number of satelites:',
                                  style: TextStyle(
                                    color: AppColors.lightTextColor,
                                    fontSize: 14,
                                  ),
                                ),
                                SizedBox(height: 6),
                                NumberInput(controller: _sateliteNumberController, isUnitVisible: false),
                              ],
                            ),
                          ),
                          SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Periapsis height:',
                                  style: TextStyle(
                                    color: AppColors.lightTextColor,
                                    fontSize: 14,
                                  ),
                                ),
                                SizedBox(height: 6),
                                NumberInput(controller: _periapsisHeightController),
                                SizedBox(height: 6),
                                Text(
                                  'Orbits per satelite:',
                                  style: TextStyle(
                                    color: AppColors.lightTextColor,
                                    fontSize: 14,
                                  ),
                                ),
                                SizedBox(height: 6),
                                NumberInput(controller: _orbitNumberController, isUnitVisible: false),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 12),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: AppColors.primaryColor,
                    ),
                    height: 60,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
