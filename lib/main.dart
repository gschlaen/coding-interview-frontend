import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'src/Theme/app_theme.dart';
import 'src/features/exchange/presentation/exchange_page.dart';

void main() {
  runApp(
    ProviderScope(
      retry: (_, __) {
        return null;
      },
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Exchange UI',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const ExchangePage(),
    );
  }
}
