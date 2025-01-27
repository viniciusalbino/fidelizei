import 'package:flutter/cupertino.dart';

class AppTheme {
  // Construtor privado para evitar instâncias acidentais
  AppTheme._();

  // 1) Definição das cores
  static const Color primaryColor   = Color(0xFF20CD8D); // #20CD8D
  static const Color secondaryColor = Color(0xFFCCF4E5); // #CCF4E5
  static const Color tertiaryColor  = Color(0xFF2D4048); // #2D4048
  static const Color darkColor      = Color(0xFF182527); // #182527
  static const Color grayColor      = Color(0xFFD9D9D9); // #D9D9D9
  static const Color whiteColor     = Color(0xFFFFFFFF); // #FFFFFF

  // 2) Definição do tema Cupertino (iOS style)
  static CupertinoThemeData get cupertinoTheme => CupertinoThemeData(
    // Cor “principal” para botões, ícones ativos etc.
    primaryColor: primaryColor,

    // Cor de fundo padrão para a tela
    scaffoldBackgroundColor: whiteColor,

    // Texto padrão (por exemplo, NavigationBar, botões, etc.)
    textTheme: CupertinoTextThemeData(
      primaryColor: tertiaryColor, // cor principal do texto
      textStyle: TextStyle(
        fontFamily: 'Arial', // Ajuste a fonte conforme desejar
        color: tertiaryColor,
        fontSize: 16,
      ),
      navLargeTitleTextStyle: TextStyle(
        fontFamily: 'Arial',
        fontWeight: FontWeight.bold,
        fontSize: 32,
        color: tertiaryColor,
      ),
      navTitleTextStyle: TextStyle(
        fontFamily: 'Arial',
        fontWeight: FontWeight.w600,
        fontSize: 17,
        color: tertiaryColor,
      ),
    ),
  );

  // 3) Exemplos de TextStyles extras (se quiser usar diretamente no código)
  static TextStyle get titleStyle => const TextStyle(
    fontFamily: 'Arial',
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: tertiaryColor,
  );

  static TextStyle get subtitleStyle => TextStyle(
    fontFamily: 'Arial',
    fontSize: 14,
    color: tertiaryColor.withOpacity(0.7),
  );
}