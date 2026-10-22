import 'package:flutter/material.dart';

class PageConfig {
  const PageConfig({
    required this.title,
    required this.appBarColor,
    required this.textColor,
  });

  final String title;
  final Color appBarColor;
  final Color textColor;
}

const Map<String, PageConfig> pageConfigs = {
  '/': PageConfig(
    title: 'Bienvenido',
    appBarColor: Colors.white,
    textColor: Colors.black
  ),
  '/porfolio': PageConfig(
    title: 'PROfolio',
    appBarColor: Colors.purple,
    textColor: Colors.white
  )

};