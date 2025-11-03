// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:el_dorado_exchange/src/features/exchange/domain/currency.dart';

/// The type of exchange.
enum ExchangeType {
  /// Fiat to crypto.
  fiatToCrypto,

  /// Crypto to fiat.
  cryptoToFiat
}

/// The state of the exchange card.
class ExchangeCardState {
  /// Creates an [ExchangeCardState].
  const ExchangeCardState({
    required this.fiatCurrency,
    required this.cryptoCurrency,
    required this.amountText,
    required this.exchangeType,
  });

  /// The selected fiat currency.
  final FiatCurrency fiatCurrency;

  /// The selected crypto currency.
  final CryptoCurrency cryptoCurrency;

  /// The amount to exchange.
  final String amountText;

  /// The type of exchange.
  final ExchangeType exchangeType;

  /// The initial state of the exchange card.
  factory ExchangeCardState.initial() {
    return const ExchangeCardState(
      fiatCurrency: FiatCurrency.brl,
      cryptoCurrency: CryptoCurrency.usdt,
      exchangeType: ExchangeType.fiatToCrypto,
      amountText: '',
    );
  }

  /// Creates a copy of the state with the given fields replaced with the new values.
  ExchangeCardState copyWith({
    FiatCurrency? fiatCurrency,
    CryptoCurrency? cryptoCurrency,
    String? amountText,
    ExchangeType? exchangeType,
  }) {
    return ExchangeCardState(
      fiatCurrency: fiatCurrency ?? this.fiatCurrency,
      cryptoCurrency: cryptoCurrency ?? this.cryptoCurrency,
      amountText: amountText ?? this.amountText,
      exchangeType: exchangeType ?? this.exchangeType,
    );
  }

  @override
  bool operator ==(covariant ExchangeCardState other) {
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
