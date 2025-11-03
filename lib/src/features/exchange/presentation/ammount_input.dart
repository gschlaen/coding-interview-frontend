import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/currency.dart';
import '../domain/exchange_card_state.dart';
import 'exchange_card_controller.dart';

class AmountInput extends ConsumerWidget {
  const AmountInput({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextFormField(
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
      ],
      cursorColor: Theme.of(context).textTheme.bodyLarge?.color,
      cursorHeight: 16,
      decoration: InputDecoration(
        isDense: true,
        prefixIconConstraints: const BoxConstraints(minWidth: 12),
        prefixIcon: Padding(
          padding: const EdgeInsets.only(left: 12),
          child: Consumer(
            builder: (context, ref, child) {
              final exchangeState = ref.watch(exchangeCardControllerProvider);
              final Currency fromCurrency =
                  exchangeState.exchangeType == ExchangeType.fiatToCrypto
                  ? exchangeState.fiatCurrency
                  : exchangeState.cryptoCurrency;

              return Text(
                fromCurrency.name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Theme.of(context).colorScheme.primary,
                ),
              );
            },
          ),
        ),
      ),
      style: Theme.of(context).textTheme.bodyLarge,
      onChanged: (value) {
        ref.read(exchangeCardControllerProvider.notifier).updateAmount(value);
      },
    );
  }
}
