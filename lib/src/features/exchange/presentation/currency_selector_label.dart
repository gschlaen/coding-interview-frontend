import 'package:flutter/material.dart';

class CurrencySelectorLabel extends StatelessWidget {
  const CurrencySelectorLabel(this.label, {super.key});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      color: Theme.of(context).cardColor,
      child: Text(label, style: Theme.of(context).textTheme.bodySmall),
    );
  }
}
