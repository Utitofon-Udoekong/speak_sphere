import 'package:flutter/material.dart';
import 'package:speak_sphere/constants/colors.dart';

class LinearProgressBar extends StatelessWidget {
  const LinearProgressBar({super.key, required this.value});
  final double value;
  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
                      borderRadius: BorderRadius.circular(20),
                      minHeight: 10,
                      backgroundColor: AppColors.gray,
                      color: AppColors.primary,
                      value: value,
                    );
  }
}