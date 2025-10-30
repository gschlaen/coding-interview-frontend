import 'package:flutter/material.dart';

import '../../../../common_widgets/primary_button.dart';
import '../../../Theme/app_theme.dart';
import '../../../constants/app_sizes.dart';
import 'ammount_input.dart';
import 'currency_selectors.dart';
import 'summary_section.dart';

class ExchangeCard extends StatelessWidget {
  const ExchangeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 325,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        border: Border.all(color: AppTheme.borderSecondary, width: 2),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).shadowColor.withValues(alpha: 0.2),
            blurRadius: 2,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const CurrencySelectors(),
          gapH16,
          const AmountInput(),
          gapH32,
          const SummarySection(),
          gapH32,
          PrimaryButton(
            text: 'Cambiar',
            onPressed: () {
              // Do nothing
            },
          ),
        ],
      ),
    );
  }
}
