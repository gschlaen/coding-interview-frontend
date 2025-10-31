// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:el_dorado_exchange/src/features/exchange/domain/currency.dart';

enum ExchangeType { fiatToCrypto, cryptoToFiat }

class ExchangeState {
  const ExchangeState({
    required this.fiatCurrency,
    required this.cryptoCurrency,
    required this.amountText,
    required this.exchangeType,
  });

  final FiatCurrency fiatCurrency;
  final CryptoCurrency cryptoCurrency;
  final String amountText;
  final ExchangeType exchangeType;

  factory ExchangeState.initial() {
    return const ExchangeState(
      fiatCurrency: FiatCurrency.brl,
      cryptoCurrency: CryptoCurrency.usdt,
      exchangeType: ExchangeType.fiatToCrypto,
      amountText: '',
    );
  }

  ExchangeState copyWith({
    FiatCurrency? fiatCurrency,
    CryptoCurrency? cryptoCurrency,
    String? amountText,
    ExchangeType? exchangeType,
  }) {
    return ExchangeState(
      fiatCurrency: fiatCurrency ?? this.fiatCurrency,
      cryptoCurrency: cryptoCurrency ?? this.cryptoCurrency,
      amountText: amountText ?? this.amountText,
      exchangeType: exchangeType ?? this.exchangeType,
    );
  }

  @override
  bool operator ==(covariant ExchangeState other) {
    if (identical(this, other)) return true;

    return other.fiatCurrency == fiatCurrency &&
        other.cryptoCurrency == cryptoCurrency &&
        other.amountText == amountText &&
        other.exchangeType == exchangeType;
  }

  @override
  int get hashCode {
    return fiatCurrency.hashCode ^
        cryptoCurrency.hashCode ^
        amountText.hashCode ^
        exchangeType.hashCode;
  }

  @override
  String toString() {
    return 'ExchangeState(fiatCurrency: $fiatCurrency, cryptoCurrency: $cryptoCurrency, amountText: $amountText, exchangeType: $exchangeType)';
  }
}
