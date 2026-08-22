import 'package:flutter/material.dart';

class CustomDialogButton extends StatelessWidget {
  const CustomDialogButton({
    super.key,
    required this.verticalPadding,
    required this.horizintalPadding,
    this.onPressed,
    required this.text,
    required this.buttonColor,
    required this.textColor,
    required this.isBorder,
  });
  final double verticalPadding;
  final double horizintalPadding;
  final void Function()? onPressed;
  final String text;
  final Color buttonColor;
  final Color textColor;
  final bool isBorder;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: verticalPadding,
          horizontal: horizintalPadding,
        ),
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(100),
          border: isBorder
              ? Border.all(
                  color: Colors.grey.shade200.withAlpha(100),
                  width: 0.4,
                )
              : null,
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 13,
            color: textColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
