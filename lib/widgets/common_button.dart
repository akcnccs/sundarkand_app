import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String label;
  final IconData? icon;
  final bool iconRight;
  final Color? backgroundColor;
  final Color? foregroundColor;

  const CommonButton({
    super.key,
    required this.onPressed,
    required this.label,
    this.icon,
    this.iconRight = false,
    this.backgroundColor,
    this.foregroundColor,
  });

  @override
  Widget build(BuildContext context) {
    final Color effectiveBackgroundColor = backgroundColor ?? Colors.orange;
    final Color effectiveForegroundColor = foregroundColor ?? Colors.white;

    final style = ElevatedButton.styleFrom(
      backgroundColor: effectiveBackgroundColor,
      foregroundColor: effectiveForegroundColor,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    );

    if (icon == null) {
      return ElevatedButton(
        onPressed: onPressed,
        style: style,
        child: Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
      );
    }

    if (iconRight) {
      return ElevatedButton(
        onPressed: onPressed,
        style: style,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(width: 8),
            Icon(icon, size: 16),
          ],
        ),
      );
    }

    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, size: 16),
      label: Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
      style: style,
    );
  }
}
