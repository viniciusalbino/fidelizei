import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../app_theme.dart';
import 'section_header.dart';
import 'menu_card.dart';
import 'vertical_item.dart';

///
/// [HomeScreen] é a tela da primeira aba, exibindo:
///   - Navigation Bar no estilo iOS (título "Home")
///   - Conteúdo com Special Taste (lista horizontal) e Original Taste (lista vertical),
///     tudo em um único scroll.
///
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Exemplo: podemos acessar o CupertinoTheme para pegar cores/textos se quisermos
    final theme = CupertinoTheme.of(context);

    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Home'),
      ),
      child: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // SPECIAL TASTE
              SectionHeader(
                title: 'Promoções',
                subtitle: 'Destaques do dia:',
                onSeeAll: () {},
              ),
              const SizedBox(height: 8),
              SizedBox(
                height: 280,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: const [
                    MenuCard(
                      title: 'Heineken',
                      subtitle: 'Cerveja Lager Heineken Garrafa 250ml',
                      price: 5.0,
                      rating: 5,
                      imageUrl: 'https://static.paodeacucar.com/img/uploads/1/48/23834048.jpg',
                    ),
                    MenuCard(
                      title: 'Corona',
                      subtitle: 'Cerveja Pilsen Corona garrafa 330ml',
                      price: 9.0,
                      imageUrl: 'https://static.paodeacucar.com/img/uploads/1/296/25036296.jpg',
                      rating: 4,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // ORIGINAL TASTE
              SectionHeader(
                title: 'Categorias',
                subtitle: "",
                onSeeAll: () {},
              ),
              const SizedBox(height: 8),
              const VerticalItem(
                title: 'Ofertas',
                subtitle: 'Melhores ofertas do dia',
                  iconPath: 'assets/icons/offer_icon.svg'
              ),
              const SizedBox(height: 16),
              const VerticalItem(
                title: 'Cervejas',
                subtitle: 'Cervejas escolhidas do dia',
                  iconPath: 'assets/icons/beer_icon.svg'
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}