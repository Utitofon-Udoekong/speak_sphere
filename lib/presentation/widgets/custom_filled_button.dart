import 'package:flutter/material.dart';
import 'package:speak_sphere/constants/colors.dart';

class CustomFilledButton extends StatelessWidget {
  const CustomFilledButton({super.key, required this.title, this.onPressed});

  final String title;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
          backgroundColor: const MaterialStatePropertyAll(AppColors.primary),
          shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
          fixedSize: MaterialStatePropertyAll(Size(width, 50))),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 20, color: AppColors.white),
      ),
    );
  }
}
