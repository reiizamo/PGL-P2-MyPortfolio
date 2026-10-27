import 'package:flutter/material.dart';

class PageConfig {
  const PageConfig({
    required this.title,
    required this.appBarColor,
    required this.textColor,
    required this.boolean
  });

  final String title;
  final Color appBarColor;
  final Color textColor;
  final bool boolean;
}

const Map<String, PageConfig> pageConfigs = {
  '/': PageConfig(
    title: '',
    appBarColor: Colors.transparent,
    textColor: Colors.white,
    boolean: true
  ),
  '/porfolio': PageConfig(
    title: 'PROfolio',
    appBarColor: Colors.purple,
    textColor: Colors.white,
    boolean: false
  )

};