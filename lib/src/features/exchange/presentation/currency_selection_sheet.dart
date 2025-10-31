import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../constants/app_sizes.dart';
import '../domain/currency.dart';
import 'exchange_controller.dart';

class CurrencySelectionSheet extends StatelessWidget {
  const CurrencySelectionSheet({super.key, required this.isFiat});

  final bool isFiat;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final List<Currency> currencies = isFiat
        ? FiatCurrency.values
        : CryptoCurrency.values;

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 60,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          gapH16,
          Text(
            isFiat ? 'FIAT' : 'Cripto',
            style: theme.textTheme.titleMedium?.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.grey[800],
            ),
          ),
          gapH16,
          Expanded(
            child: Consumer(
              builder: (context, ref, child) {
                final exchangeController = ref.watch(
                  exchangeControllerProvider,
                );
                Currency selectedCurrency = isFiat
                    ? exchangeController.fiatCurrency
                    : exchangeController.cryptoCurrency;
                return RadioGroup<Currency>(
                  onChanged: (currency) {
                    ref
                        .read(exchangeControllerProvider.notifier)
                        .updateCurrency(currency!);
                    Navigator.pop(context);
                  },
                  groupValue: selectedCurrency,
                  child: ListView.separated(
                    separatorBuilder: (context, index) => gapH4,
                    itemCount: currencies.length,
                    itemBuilder: (context, index) {
                      final currency = currencies[index];
                      final bool isSelected = currency == selectedCurrency;

                      return _CurrencyItem(
                        currency: currency,
                        isSelected: isSelected,
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _CurrencyItem extends ConsumerWidget {
  const _CurrencyItem({required this.currency, required this.isSelected});

  final Currency currency;
  final bool isSelected;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: () {
        ref.read(exchangeControllerProvider.notifier).updateCurrency(currency);
        Navigator.pop(context);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Row(
          children: [
            Image.asset(currency.iconAsset, width: 26, height: 26),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  currency.name,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  currency.description,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
            const Spacer(),
            Radio<Currency>(value: currency),
          ],
        ),
      ),
    );
  }
}
