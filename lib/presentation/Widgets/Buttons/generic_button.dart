import 'package:flutter/material.dart';

class GenericButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final Color backgroundColor;
  final Color textColor;
  final double fontSize;
  final double height;
  final double borderRadius;
  final bool isLoading;
  final bool hasBorder; // هل يظهر بوردر خارجي
  final Color borderColor; // لون البوردر إذا مفعل

  const GenericButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.backgroundColor = const Color(0xFF667eea),
    this.textColor = Colors.white,
    this.fontSize = 16,
    this.height = 46,
    this.borderRadius = 12,
    this.isLoading = false,
    this.hasBorder = false,
    this.borderColor = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: isLoading,
      child: SizedBox(
        width: double.infinity,
        height: height,
        child: ElevatedButton(
          onPressed: isLoading ? null : onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              side: hasBorder
                  ? BorderSide(color: borderColor, width: 1)
                  : BorderSide.none,
            ),
          ),
          child: isLoading
              ? SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: textColor,
                  ),
                )
              : Text(
                  label,
                  style: TextStyle(
                    color: textColor,
                    fontSize: fontSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
        ),
      ),
    );
  }
}
