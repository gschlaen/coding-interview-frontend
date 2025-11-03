import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/get_recommendations_params.dart';
import '../data/quote_repository.dart';
import '../domain/currency.dart';
import '../domain/exchange_card_state.dart';

class ExchangeCardController extends Notifier<ExchangeCardState> {
  /// Used to debounce the input queries
  Timer? _debounceTimer;

  @override
  ExchangeCardState build() {
    // Close the StreamController and cancel the subscriptions on dispose
    ref.onDispose(() {
      _debounceTimer?.cancel();
    });
    return ExchangeCardState.initial();
  }

  void swapCurrencies() {
    // Cancel the timer if it is active
    if (_debounceTimer != null) {
      _debounceTimer!.cancel();
    }
    _debounceTimer = Timer(const Duration(milliseconds: 500), () {
      if (state.exchangeType == ExchangeType.fiatToCrypto) {
        // only update the state once the query has been debounced
        state = state.copyWith(exchangeType: ExchangeType.cryptoToFiat);
      } else {
        state = state.copyWith(exchangeType: ExchangeType.fiatToCrypto);
      }
    });
  }

  void updateCurrency(Currency currency) {
    // Cancel the timer if it is active
    if (_debounceTimer != null) {
      _debounceTimer!.cancel();
    }
    _debounceTimer = Timer(const Duration(milliseconds: 500), () {
      // only update the state once the query has been debounced
      if (currency is FiatCurrency) {
        state = state.copyWith(fiatCurrency: currency);
      } else {
        state = state.copyWith(cryptoCurrency: currency as CryptoCurrency);
      }
    });
  }

  void updateAmount(String newAmount) {
    // Cancel the timer if it is active
    if (_debounceTimer != null) {
      _debounceTimer!.cancel();
    }
    _debounceTimer = Timer(const Duration(milliseconds: 500), () {
      // only update the state once the query has been debounced
      state = state.copyWith(amountText: newAmount);
    });
  }
}

final exchangeCardControllerProvider =
    NotifierProvider<ExchangeCardController, ExchangeCardState>(
      ExchangeCardController.new,
    );

final recommendationsResultProvider = FutureProvider((ref) async {
  final state = ref.watch(exchangeCardControllerProvider);
  final type = state.exchangeType == ExchangeType.fiatToCrypto ? 1 : 0;
  final amountCurrencyId = state.exchangeType == ExchangeType.fiatToCrypto
      ? state.fiatCurrency.id
      : state.cryptoCurrency.id;
  final params = GetRecommendationsParams(
    type: type,
    cryptoCurrencyId: state.cryptoCurrency.id,
    fiatCurrencyId: state.fiatCurrency.id,
    amount: state.amountText,
    amountCurrencyId: amountCurrencyId,
  );
  return ref.read(recommendationsProvider(params).future);
});
