import 'package:flutter/material.dart';

class _QuoteInfoRow extends StatelessWidget {
  const _QuoteInfoRow({
    required this.label,
    required this.value,
    required this.suffix,
  });

  final String label;
  final String value;
  final String suffix;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final labelStyle = textTheme.labelLarge?.copyWith(
      color: Colors.grey[600],
      fontWeight: FontWeight.w600,
    );
    final valueStyle = textTheme.bodyLarge?.copyWith(
      fontWeight: FontWeight.bold,
    );
    final suffixStyle = Theme.of(context).textTheme.bodySmall;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: labelStyle),
        Spacer(),
        Text(value, style: valueStyle),
        Text(suffix, style: suffixStyle),
      ],
    );
  }
}

class QuoteInfo extends StatelessWidget {
  const QuoteInfo({
    super.key,
    required this.exchangeRate,
    required this.rateSymbol,
    required this.totalAmount,
    required this.amountSymbol,
    required this.releaseTimeString,
    required this.timeSuffix,
  });

  const QuoteInfo.empty({super.key})
    : exchangeRate = '',
      rateSymbol = '',
      totalAmount = '',
      amountSymbol = '',
      releaseTimeString = '',
      timeSuffix = '';

  final String exchangeRate;
  final String rateSymbol;
  final String totalAmount;
  final String amountSymbol;
  final String releaseTimeString;
  final String timeSuffix;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).cardColor;
    return Column(
      spacing: 8,
      children: [
        _QuoteInfoRow(
          label: 'Tasa estimada',
          value: exchangeRate,
          suffix: rateSymbol,
        ),
        _QuoteInfoRow(
          label: 'Recibirás',
          value: totalAmount,
          suffix: amountSymbol,
        ),
        _QuoteInfoRow(
          label: 'Tiempo estimado',
          value: releaseTimeString,
          suffix: timeSuffix,
        ),
      ].map((child) => ColoredBox(color: color, child: child)).toList(),
    );
  }
}
