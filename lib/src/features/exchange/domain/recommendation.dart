class Recommendation {
  const Recommendation({required this.byPrice});

  final ByPrice byPrice;

  factory Recommendation.fromJson(Map<dynamic, dynamic> json) {
    final data = (json['data'] as Map<dynamic, dynamic>)
        .cast<String, dynamic>();

    return Recommendation(
      byPrice: ByPrice.fromJson(data['byPrice'] as Map<dynamic, dynamic>),
    );
  }
}

class ByPrice {
  const ByPrice({
    required this.fiatToCryptoExchangeRate,
    required this.offerMakerStats,
  });

  final String fiatToCryptoExchangeRate;
  final OfferMakerStats offerMakerStats;

  factory ByPrice.fromJson(Map<dynamic, dynamic> json) {
    return ByPrice(
      fiatToCryptoExchangeRate: json['fiatToCryptoExchangeRate'] as String,

      offerMakerStats: OfferMakerStats.fromJson(
        json['offerMakerStats'] as Map<dynamic, dynamic>? ?? {},
      ),
    );
  }
}

class OfferMakerStats {
  const OfferMakerStats({required this.releaseTime});

  final double releaseTime;

  factory OfferMakerStats.fromJson(Map<dynamic, dynamic> json) {
    return OfferMakerStats(
      releaseTime: (json['releaseTime'] as num? ?? 0).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {'releaseTime': releaseTime};
  }
}
