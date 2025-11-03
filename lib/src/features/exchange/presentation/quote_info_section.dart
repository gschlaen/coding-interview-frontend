import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shimmer/shimmer.dart';

import '../../../exceptions/app_exception.dart';
import '../domain/exchange_card_state.dart';
import 'exchange_card_controller.dart';
import 'quote_info.dart';

class QuoteInfoSection extends ConsumerWidget {
  const QuoteInfoSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final exchangeState = ref.read(exchangeCardControllerProvider);
    final quote = ref.watch(recommendationsResultProvider);

    return quote.when(
      data: (data) {
        if (data == null) {
          return QuoteInfo.empty();
        }
        final exchangeRate = data.byPrice.fiatToCryptoExchangeRate;
        final amount = double.tryParse(exchangeState.amountText) ?? 0.00;
        final totalAmount =
            exchangeState.exchangeType == ExchangeType.cryptoToFiat
            ? (amount * num.parse(exchangeRate)).toStringAsFixed(2)
            : (amount / num.parse(exchangeRate)).toStringAsFixed(2);

        final releaseTimeString = data.byPrice.offerMakerStats.releaseTime < 1.0
            ? '< 1'
            : data.byPrice.offerMakerStats.releaseTime.round().toString();

        final fiatCurrency = exchangeState.fiatCurrency;
        final cryptoCurrency = exchangeState.cryptoCurrency;
        final rateSymbol = fiatCurrency.name;
        final amountSymbol =
            exchangeState.exchangeType == ExchangeType.fiatToCrypto
            ? cryptoCurrency.name
            : fiatCurrency.name;
        return QuoteInfo(
          exchangeRate: '≈ $exchangeRate',
          rateSymbol: ' $rateSymbol',
          totalAmount: '≈ $totalAmount',
          amountSymbol: ' $amountSymbol',
          releaseTimeString: '≈ $releaseTimeString',
          timeSuffix: ' Min',
        );
      },
      error: (error, stackTrace) {
        final message = error is NoDataException ? 'Sin cotización' : 'Error';
        return QuoteInfo(
          exchangeRate: message,
          rateSymbol: '',
          totalAmount: message,
          amountSymbol: '',
          releaseTimeString: message,
          timeSuffix: '',
        );
      },
      loading: () => Shimmer.fromColors(
        baseColor: const Color(0xFFE0E0E0),
        highlightColor: const Color(0xFFF5F5F5),
        child: QuoteInfo.empty(),
      ),
    );
  }
}
