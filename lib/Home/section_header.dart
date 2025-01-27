import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../app_theme.dart';

// ------------------------------------------------------
// Widgets auxiliares para layout do menu (HomeScreen)
// ------------------------------------------------------

class SectionHeader extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback onSeeAll;

  const SectionHeader({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.onSeeAll,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Título e subtítulo
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[700],
              ),
            ),
          ],
        ),
        // Botão "see all"
        CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: onSeeAll,
          child: const Text(
            'Ver Tudo',
            style: TextStyle(color: AppTheme.primaryColor),
          ),
        )
      ],
    );
  }
}