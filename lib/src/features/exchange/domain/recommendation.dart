/// Represents a recommendation from the API.
class Recommendation {
  /// Creates a [Recommendation].
  const Recommendation({required this.byPrice});

  /// The recommendation by price.
  final ByPrice byPrice;

  /// Creates a [Recommendation] from a JSON object.
  factory Recommendation.fromJson(Map<dynamic, dynamic> json) {
    final data = (json['data'] as Map<dynamic, dynamic>)
        .cast<String, dynamic>();

    return Recommendation(
      byPrice: ByPrice.fromJson(data['byPrice'] as Map<dynamic, dynamic>),
    );
  }
}

/// Represents the recommendation by price.
class ByPrice {
  /// Creates a [ByPrice].
  const ByPrice({
    required this.fiatToCryptoExchangeRate,
    required this.offerMakerStats,
  });

  /// The exchange rate from fiat to crypto.
  final String fiatToCryptoExchangeRate;

  /// The stats of the offer maker.
  final OfferMakerStats offerMakerStats;

  /// Creates a [ByPrice] from a JSON object.
  factory ByPrice.fromJson(Map<dynamic, dynamic> json) {
    return ByPrice(
      fiatToCryptoExchangeRate: json['fiatToCryptoExchangeRate'] as String,
      offerMakerStats: OfferMakerStats.fromJson(
        json['offerMakerStats'] as Map<dynamic, dynamic>? ?? {},
      ),
    );
  }
}

/// Represents the stats of the offer maker.
class OfferMakerStats {
  /// Creates an [OfferMakerStats].
  const OfferMakerStats({required this.releaseTime});

  /// The release time of the offer.
  final double releaseTime;

  /// Creates an [OfferMakerStats] from a JSON object.
  factory OfferMakerStats.fromJson(Map<dynamic, dynamic> json) {
    return OfferMakerStats(
      releaseTime: (json['releaseTime'] as num? ?? 0).toDouble(),
    );
  }

  /// Converts the [OfferMakerStats] to a JSON object.
  Map<String, dynamic> toJson() {
    return {'releaseTime': releaseTime};
  }
}
