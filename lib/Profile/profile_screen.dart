import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../app_theme.dart';
import 'purchase_card.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      // Barra de navegação estilo iOS
      navigationBar: CupertinoNavigationBar(
        middle: const Text('Seu Programa de Fidelidade'),
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          child: const Icon(CupertinoIcons.star_fill),
          onPressed: () {
            // Ação do botão
          },
        ),
      ),
      // Conteúdo principal
      child: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header: "Bem-vindo, Usuário"
              const Text(
                'Bem-vindo, Usuário',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),

              // Sessão de Pontos
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: AppTheme.whiteColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  'Pontos: 66pts',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Cartão escuro com benefícios
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: AppTheme.tertiaryColor, // Ajuste p/ seu tema
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Boa tarde, VINICIUS',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: CupertinoColors.white,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Veja os benefícios por níveis',
                      style: TextStyle(
                        fontSize: 14,
                        color: CupertinoColors.inactiveGray,
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Lista de benefícios
                    _BenefitRow(texto: 'Ofertas exclusivas Cliente Fidelizei'),
                    _BenefitRow(texto: 'Meu Desconto com Ofertas personalizadas'),
                    _BenefitRow(texto: '5 pontos a cada R\$20,00 na mercearia'),
                    _BenefitRow(texto: 'Mais 20% Off em vinhos, espumantes'),
                    _BenefitRow(texto: 'Frete grátis em compras online acima de R\$10,00'),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Seção de Missões
              const Text(
                'Missões para subir de nível',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),

              // Missão 1
              Material(
                // Envolvemos em Material para usar LinearProgressIndicator
                color: Colors.transparent,
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  margin: const EdgeInsets.only(bottom: 12),
                  decoration: BoxDecoration(
                    color: CupertinoColors.systemGrey5,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Missão 1: Compre em 8 de 12 semanas',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      LinearProgressIndicator(
                        value: 8 / 12, // ~66%
                        color: AppTheme.primaryColor,
                        backgroundColor: Colors.grey[300],
                      ),
                    ],
                  ),
                ),
              ),

              // Missão 2
              Material(
                color: Colors.transparent,
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: CupertinoColors.systemGrey5,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Missão 2: Conquiste 5 estrelas',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      LinearProgressIndicator(
                        value: 3 / 5, // ~60%
                        color: AppTheme.primaryColor,
                        backgroundColor: Colors.grey[300],
                      ),
                    ],
                  ),
                ),
              ),
              // Missões
              const Text(
                'Missões para subir de nível',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),

              // Exemplo de Missão 1 / Missão 2...
              // ...

              const SizedBox(height: 24),

              // 3) Aqui inserimos a cartela de compras
              const PurchasesCard(),

            ],
          ),
        ),
      ),
    );
  }
}

/// Widget auxiliar para exibir cada linha de benefício no cartão escuro
class _BenefitRow extends StatelessWidget {
  final String texto;
  const _BenefitRow({Key? key, required this.texto}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Podemos usar um icone Cupertino
        const Icon(
          CupertinoIcons.check_mark_circled_solid,
          color: CupertinoColors.activeGreen,
          size: 20,
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            texto,
            style: const TextStyle(
              color: CupertinoColors.white,
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
  }
}