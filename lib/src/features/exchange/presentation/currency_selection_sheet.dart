import 'package:el_dorado_exchange/src/features/exchange/domain/currency.dart';
import 'package:flutter/material.dart';

import '../../../constants/app_sizes.dart';

class CurrencySelectionSheet extends StatelessWidget {
  const CurrencySelectionSheet({super.key, required this.isFiat});

  final bool isFiat;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final List<Currency> currencies = isFiat
        ? FiatCurrency.values
        : CryptoCurrency.values;
    // TODO: make selectedCurrencyCode dynamic
    const String selectedCurrencyId = 'VES';

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
          // TODO: update items depending on FIAT or cripto
          Expanded(
            child: RadioGroup<String>(
              onChanged: (value) {
                //  TODO: update selected item
              },
              groupValue: selectedCurrencyId,
              child: ListView.separated(
                separatorBuilder: (context, index) => gapH4,
                itemCount: currencies.length,
                itemBuilder: (context, index) {
                  final currency = currencies[index];
                  final id = currency.id;
                  final bool isSelected = id == selectedCurrencyId;
                  return _CurrencyItem(
                    currency: currency,
                    isSelected: isSelected,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CurrencyItem extends StatelessWidget {
  const _CurrencyItem({required this.currency, required this.isSelected});

  final Currency currency;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: () {
        // TODO: update selected item
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
            Radio<String>(value: currency.id),
          ],
        ),
      ),
    );
  }
}
