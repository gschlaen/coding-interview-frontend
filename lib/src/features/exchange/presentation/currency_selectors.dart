import 'package:flutter/material.dart';

import 'currency_dropdown.dart';
import 'currency_selector_label.dart';
import 'currency_switch.dart';

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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CurrencyDropdown(
                // TODO: make currencyCode and icon dynamic
                currencyCode: 'USDT',
                icon: const CircleAvatar(
                  radius: 12,
                  backgroundColor: Color(0xFF50AF95),
                  child: Text(
                    'T',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
              CurrencyDropdown(
                // TODO: make currencyCode and icon dynamic
                currencyCode: 'VES',
                icon: const CircleAvatar(
                  radius: 12,
                  backgroundColor: Color(0xFF0033A0), // Azul de la bandera VES
                  child: Text(
                    'V',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
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
