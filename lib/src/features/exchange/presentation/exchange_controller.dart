import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/currency.dart';
import '../domain/exchange_state.dart';

class ExchangeController extends Notifier<ExchangeState> {
  @override
  ExchangeState build() {
    return ExchangeState.initial();
  }

  void swapCurrencies() {
    if (state.exchangeType == ExchangeType.fiatToCrypto) {
      state = state.copyWith(exchangeType: ExchangeType.cryptoToFiat);
    } else {
      state = state.copyWith(exchangeType: ExchangeType.fiatToCrypto);
    }
  }

  void updateCurrency(Currency currency) {
    if (currency is FiatCurrency) {
      state = state.copyWith(fiatCurrency: currency);
    } else {
      state = state.copyWith(cryptoCurrency: currency as CryptoCurrency);
    }
  }

  void updateAmount(String newAmount) {
    state = state.copyWith(amountText: newAmount);
  }
}

final exchangeControllerProvider =
    NotifierProvider<ExchangeController, ExchangeState>(ExchangeController.new);

final parsedAmountProvider = Provider<double>((ref) {
  final amountText = ref.watch(
    exchangeControllerProvider.select((state) => state.amountText),
  );
  return double.tryParse(amountText) ?? 0.0;
});
