import 'package:flutter/material.dart';

import 'background_view.dart';
import 'exchange_card.dart';

class ExchangePage extends StatelessWidget {
  const ExchangePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          BackgroundView(),
          Center(child: ExchangeCard()),
        ],
      ),
    );
  }
}
