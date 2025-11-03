import 'package:flutter/material.dart';

import 'background_view.dart';
import 'exchange_card.dart';

class ExchangePage extends StatelessWidget {
  const ExchangePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: const Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            BackgroundView(),
            Center(child: ExchangeCard()),
          ],
        ),
      ),
    );
  }
}
