import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ksp_satelite_constelation_calculator/core/theme/app_theme.dart';

class NumberInput extends StatefulWidget {
  final TextEditingController controller;
  final bool isUnitVisible; // Boolean to control visibility of 'm'

  const NumberInput({
    Key? key,
    required this.controller,
    this.isUnitVisible = true, // Default to true, so 'm' is visible by default
  }) : super(key: key);

  @override
  State<NumberInput> createState() => _NumberInputState();
}

class _NumberInputState extends State<NumberInput> {
  final FocusNode _focusNode = FocusNode();

  void _increaseValue() {
    int currentValue = int.tryParse(widget.controller.text) ?? 1; // Default to 1 if the value is empty
    widget.controller.text = (currentValue + 1).toString();
  }

  void _decreaseValue() {
    int currentValue = int.tryParse(widget.controller.text) ?? 1;
    // Ensure the value doesn't go below 1
    if (currentValue > 1) {
      widget.controller.text = (currentValue - 1).toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        // Container for TextField with Expanded to occupy space in Row
        Expanded(
          child: Container(
            height: 58,
            decoration: BoxDecoration(
              color: AppColors.secondaryColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: widget.controller,
                    focusNode: _focusNode,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly, // Only allow digits
                    ],
                    style: TextStyle(
                      color: AppColors.lightTextColor,
                      fontSize: 16,
                    ),
                    onChanged: (value) {
                      // If the user tries to set the value to 0, reset it to 1
                      if (int.tryParse(value) == 0) {
                        widget.controller.text = '1';
                      }
                    },
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 16),
                    ),
                  ),
                ),
                if (widget.isUnitVisible)
                  Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: Text(
                      'm',
                      style: TextStyle(
                        color: AppColors.lightTextColor,
                        fontSize: 16,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
        SizedBox(width: 3),
        // Buttons appear when isUnitVisible is false, and they are outside the container
        if (!widget.isUnitVisible)
          SizedBox(
            height: 58,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween, // Centering the buttons vertically
              children: [
                // Increase Button
                GestureDetector(
                  onTap: _increaseValue,
                  child: Container(
                    width: 48,
                    height: 28,
                    decoration: BoxDecoration(
                      color: AppColors.secondaryColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Transform.scale(
                        scale: 1.5,
                        child: Icon(
                          Icons.arrow_drop_up,
                          color: AppColors.lightTextColor,
                          size: 24,
                        ),
                      ),
                    ),
                  ),
                ),
                // Decrease Button
                GestureDetector(
                  onTap: _decreaseValue,
                  child: Container(
                    width: 48,
                    height: 28,
                    decoration: BoxDecoration(
                      color: AppColors.secondaryColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Transform.scale(
                        scale: 1.5,
                        child: Icon(
                          Icons.arrow_drop_down,
                          color: AppColors.lightTextColor,
                          size: 24,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
