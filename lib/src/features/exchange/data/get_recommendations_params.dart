/// The parameters for the getRecommendations method.
class GetRecommendationsParams {
  /// Creates a [GetRecommendationsParams].
  GetRecommendationsParams({
    required this.type,
    required this.cryptoCurrencyId,
    required this.fiatCurrencyId,
    required this.amount,
    required this.amountCurrencyId,
  });

  /// The type of exchange.
  final int type;

  /// The ID of the crypto currency.
  final String cryptoCurrencyId;

  /// The ID of the fiat currency.
  final String fiatCurrencyId;

  /// The amount to exchange.
  final String amount;

  /// The ID of the currency of the amount.
  final String amountCurrencyId;
}
