import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/currency.dart';
import '../domain/exchange_card_state.dart';
import 'currency_dropdown.dart';
import 'currency_selector_label.dart';
import 'currency_switch.dart';
import 'exchange_card_controller.dart';

class CurrencySelectors extends StatelessWidget {
  const CurrencySelectors({super.key});

  @override
  Widget build(BuildContext context) {
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
          child: Consumer(
            builder: (context, ref, child) {
              final exchangeState = ref.watch(exchangeCardControllerProvider);
              final (
                Currency fromCurrency,
                Currency toCurrency,
              ) = exchangeState.exchangeType == ExchangeType.fiatToCrypto
                  ? (exchangeState.fiatCurrency, exchangeState.cryptoCurrency)
                  : (exchangeState.cryptoCurrency, exchangeState.fiatCurrency);
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CurrencyDropdown(currency: fromCurrency),
                  CurrencyDropdown(currency: toCurrency),
                ],
              );
            },
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
