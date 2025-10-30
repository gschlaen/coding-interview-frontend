import 'package:flutter/material.dart';

class SummarySection extends StatelessWidget {
  const SummarySection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      spacing: 8,
      children: [
        // TODO: make value and suffix dynamic
        _SummaryRow(label: 'Tasa estimada', value: '25.00', suffix: ' VES'),
        _SummaryRow(label: 'Recibirás', value: '125.00', suffix: ' VES'),
        _SummaryRow(label: 'Tiempo estimado', value: '10', suffix: ' Min'),
      ],
    );
  }
}

class _SummaryRow extends StatelessWidget {
  const _SummaryRow({
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
        Text("≈ $value", style: valueStyle),
        Text(suffix, style: suffixStyle),
      ],
    );
  }
}
