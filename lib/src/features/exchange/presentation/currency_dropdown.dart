import 'package:flutter/material.dart';

import '../../../constants/app_sizes.dart';

class CurrencyDropdown extends StatelessWidget {
  const CurrencyDropdown({
    super.key,
    required this.currencyCode,
    required this.icon,
  });

  final String currencyCode;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // TODO: show sheet
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
        child: Row(
          children: [
            icon,
            gapW8,
            Text(currencyCode, style: Theme.of(context).textTheme.bodyMedium),
            gapW4,
            Icon(
              Icons.keyboard_arrow_down_rounded,
              size: 24,
              color: Theme.of(
                context,
              ).textTheme.bodyMedium?.color?.withValues(alpha: 0.7),
            ),
          ],
        ),
      ),
    );
  }
}
