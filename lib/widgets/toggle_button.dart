import 'package:flutter/material.dart';
import 'package:ksp_satelite_constelation_calculator/core/theme/app_theme.dart';

class ToggleButton extends StatefulWidget {
  final String title;
  final VoidCallback? onEnabled; // Made onEnabled optional
  final VoidCallback? onDisabled;

  const ToggleButton({
    Key? key,
    required this.title,
    this.onEnabled,  // Made onEnabled optional
    this.onDisabled,
  }) : super(key: key);

  @override
  _ToggleButtonState createState() => _ToggleButtonState();
}

class _ToggleButtonState extends State<ToggleButton> {
  bool _isEnabled = true;

  void _toggleButton() {
    setState(() {
      _isEnabled = !_isEnabled;
    });

    // Call onEnabled or onDisabled if they're provided
    if (_isEnabled) {
      widget.onEnabled?.call();  // Safely call if not null
    } else {
      widget.onDisabled?.call();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: _toggleButton,
        child: Container(
          height: 30,
          decoration: BoxDecoration(
            color: _isEnabled ? AppColors.primaryColor : AppColors.disabledColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Text(
              widget.title,
              style: TextStyle(
                color: AppColors.lightTextColor,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
