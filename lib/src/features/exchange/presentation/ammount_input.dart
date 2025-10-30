import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AmountInput extends StatelessWidget {
  const AmountInput({super.key});

  @override
  Widget build(BuildContext context) {
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
          child: Text(
            'USDT',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
      ),
      style: Theme.of(context).textTheme.bodyLarge,
      onChanged: (value) {
        // TODO: update ammount
      },
    );
  }
}
