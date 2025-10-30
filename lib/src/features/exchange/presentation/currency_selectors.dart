import 'package:flutter/material.dart';

import '../domain/currency.dart';
import 'currency_dropdown.dart';
import 'currency_selector_label.dart';
import 'currency_switch.dart';

class CurrencySelectors extends StatelessWidget {
  const CurrencySelectors({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO:
    final fromCurrency = CryptoCurrency.usdt;
    final toCurrency = FiatCurrency.cop;

    return Stack(
      alignment: Alignment.center,
      clipBehavior: Clip.none,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            border: Border.all(
              color: Theme.of(context).colorScheme.primary,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(32),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CurrencyDropdown(currency: fromCurrency),
              CurrencyDropdown(currency: toCurrency),
            ],
          ),
        ),
        _LeftLabel(),
        _RightLabel(),
        CurrencySwitch(),
      ],
    );
  }
}

class _LeftLabel extends StatelessWidget {
  const _LeftLabel();

  @override
  Widget build(BuildContext context) {
    return Positioned(top: -4, left: 24, child: CurrencySelectorLabel("TENGO"));
  }
}

class _RightLabel extends StatelessWidget {
  const _RightLabel();

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: -4,
      right: 24,
      child: CurrencySelectorLabel("QUIERO"),
    );
  }
}
