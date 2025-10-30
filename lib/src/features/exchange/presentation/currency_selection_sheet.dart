import 'package:flutter/material.dart';

import '../../../constants/app_sizes.dart';

class CurrencySelectionSheet extends StatelessWidget {
  const CurrencySelectionSheet({super.key});
  // TODO: replace with Model data
  static const List<Map<String, String>> _mockCurrencies = [
    {'code': 'VES', 'name': 'Bolívares (Bs)', 'flag': '🇻🇪'},
    {'code': 'COP', 'name': 'Pesos Colombianos (COL\$)', 'flag': '🇨🇴'},
    {'code': 'ARS', 'name': 'Pesos Argentinos (ARS\$)', 'flag': '🇦🇷'},
    {'code': 'PEN', 'name': 'Soles Peruano (S/.)', 'flag': '🇵🇪'},
    {'code': 'BRL', 'name': 'Real Brasileño (R\$)', 'flag': '🇧🇷'},
    {'code': 'BOB', 'name': 'Boliviano (R\$)', 'flag': '🇧🇴'},
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    // TODO: make selectedCurrencyCode dynamic
    const String selectedCurrencyCode = 'VES';

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
          // TODO: update data in Text depending on FIAT or cripto
          Text(
            'FIAT',
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
              groupValue: "",
              child: ListView.separated(
                separatorBuilder: (context, index) => gapH4,
                itemCount: _mockCurrencies.length,
                itemBuilder: (context, index) {
                  final currency = _mockCurrencies[index];
                  final code = currency['code']!;
                  final bool isSelected = code == selectedCurrencyCode;
                  return _CurrencyItem(
                    code: code,
                    flag: currency['flag']!,
                    name: currency['name']!,
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
  const _CurrencyItem({
    required this.flag,
    required this.code,
    required this.name,
    required this.isSelected,
  });
  // TODO: update to use a data model
  final String flag;
  final String code;
  final String name;
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
            Text(flag, style: const TextStyle(fontSize: 28)),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  code,
                  style: theme.textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  name,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
            const Spacer(),
            Radio<String>(value: code),
          ],
        ),
      ),
    );
  }
}
