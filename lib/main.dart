import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'app_theme.dart';
import 'Home/home_screen.dart';
import 'Profile/profile_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      title: 'iOS Style App',

      // Aqui definimos o tema do App para todo o projeto
      theme: AppTheme.cupertinoTheme,

      // Tela inicial
      home: const MainTabScaffold(),
    );
  }
}

///
/// [MainTabScaffold] configura a estrutura geral das abas no bottom.
/// São 4 abas: Home, Descontos, Perfil e Configurações.
///
class MainTabScaffold extends StatelessWidget {
  const MainTabScaffold({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        // Use a primaryColor para o item selecionado, e algo suave para o inativo
        activeColor: AppTheme.primaryColor,
        inactiveColor: AppTheme.tertiaryColor.withOpacity(0.5),
        backgroundColor: AppTheme.whiteColor,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.tag),
            label: 'Descontos',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person),
            label: 'Perfil',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.gear),
            label: 'Configurações',
          ),
        ],
      ),
      tabBuilder: (context, index) {
        switch (index) {
          case 0:
            return CupertinoTabView(
              builder: (context) => const HomeScreen(),
            );
          case 1:
            return CupertinoTabView(
              builder: (context) => const PlaceholderScreen(title: 'Descontos'),
            );
          case 2:
            return CupertinoTabView(
              builder: (context) => const Profile(),
            );
          default:
            return CupertinoTabView(
              builder: (context) =>
              const PlaceholderScreen(title: 'Configurações'),
            );
        }
      },
    );
  }
}

///
/// [PlaceholderScreen] é apenas uma tela simples para as abas vazias.
///
class PlaceholderScreen extends StatelessWidget {
  final String title;
  const PlaceholderScreen({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(title),
      ),
      child: Center(
        child: Text(
          'Tela "$title" (sem conteúdo)',
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}



