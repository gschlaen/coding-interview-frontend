class GetRecommendationsParams {
  GetRecommendationsParams({
    required this.type,
    required this.cryptoCurrencyId,
    required this.fiatCurrencyId,
    required this.amount,
    required this.amountCurrencyId,
  });
  final int type;
  final String cryptoCurrencyId;
  final String fiatCurrencyId;
  final String amount;
  final String amountCurrencyId;
}
