import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../app_theme.dart';
import 'package:intl/intl.dart';

/// Card horizontal para SPECIAL TASTE
class MenuCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final int rating;
  final double price;
  final String imageUrl;

  const MenuCard({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.imageUrl,
    this.rating = 4,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final currencyFormat = NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');

    return AspectRatio(
      aspectRatio: 0.75,
      child: Container(
        // AQUI: adicionamos espaçamento em cima (8) e embaixo (8), e mantemos right(16).
        margin: const EdgeInsets.only(top: 8, bottom: 8, right: 16),
        decoration: BoxDecoration(
          color: CupertinoColors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.15),
              blurRadius: 8,
              offset: const Offset(0, 2),
            )
          ],
        ),
        child: Column(
          children: [
            Expanded(
              flex: 6,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.contain,
                  width: double.infinity,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return const Center(child: CircularProgressIndicator());
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return const Center(child: Icon(Icons.error));
                  },
                ),
              ),
            ),

            // Título, subtítulo e estrelas
            Expanded(
              flex: 4,
              child: Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(fontWeight: FontWeight.bold,
                          color: AppTheme.primaryColor),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[600],
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 6),
                    // PREÇO (novo) acima do rating
                    Text(
                      currencyFormat.format(price),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppTheme.tertiaryColor,
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 6),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(rating, (index) {
                        return const Icon(
                          CupertinoIcons.star_fill,
                          size: 14,
                          color: CupertinoColors.systemYellow,
                        );
                      }),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}