import 'package:flutter/material.dart';
import '../features/reading/models/verse.dart';

class VerseTile extends StatelessWidget {
  final Verse verse;
  final bool isActive;
  final VoidCallback? onTap;

  const VerseTile({
    super.key,
    required this.verse,
    this.isActive = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isActive ? Colors.orange.withOpacity(0.1) : null,
          border: const Border(
            bottom: BorderSide(color: Colors.black12),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              verse.number,
              style: const TextStyle(
                color: Colors.orange,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              verse.text,
              style: const TextStyle(
                fontSize: 18,
                height: 1.5,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              verse.translation,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
