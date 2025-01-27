import 'package:flutter/material.dart';
import '../app_theme.dart';

class PurchasesCard extends StatelessWidget {
  const PurchasesCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Exemplo: pegue a cor primária do tema ou use algo fixo.
    // final primaryColor = Theme.of(context).primaryColor;
    // Aqui, para simplificar, usarei uma cor fictícia de exemplo:
    const primaryColor = AppTheme.primaryColor;

    // Quantidade de quadrados preenchidos
    const filledCount = 3;
    // Total de quadrados
    const totalSquares = 10;

    return Container(
      color: AppTheme.secondaryColor, // Fundo cinza
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Numero de compras:',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),

          // Grid com 2 linhas x 5 colunas = 10 quadrados
          GridView.count(
            crossAxisCount: 5,          // 5 colunas
            crossAxisSpacing: 8,        // espaço horizontal
            mainAxisSpacing: 8,         // espaço vertical
            shrinkWrap: true,           // permite altura dinâmica
            physics: const NeverScrollableScrollPhysics(), // não rola
            children: List.generate(totalSquares, (index) {
              // Preenche os primeiros 3 com primaryColor, o restante em branco
              final isFilled = index < filledCount;
              return Container(
                decoration: BoxDecoration(
                  color: isFilled ? primaryColor : Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}