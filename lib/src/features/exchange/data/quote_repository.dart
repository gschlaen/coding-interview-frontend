import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/api/api_client.dart';
import '../../../exceptions/app_exception.dart';
import '../domain/recommendation.dart';
import 'get_recommendations_params.dart';

/// A repository for fetching quote recommendations.
class QuoteRepository {
  /// Creates a [QuoteRepository].
  QuoteRepository({required ApiClient apiClient}) : _apiClient = apiClient;
  final ApiClient _apiClient;

  /// Fetches a [Recommendation] based on the provided parameters.
  Future<Recommendation?> getRecommendations({
    required int type,
    required String cryptoCurrencyId,
    required String fiatCurrencyId,
    required String amount,
    required String amountCurrencyId,
  }) async {
    final response = await _apiClient.get(
      'stage/orderbook/public/recommendations',
      queryParameters: {
        'type': type.toString(),
        'cryptoCurrencyId': cryptoCurrencyId,
        'fiatCurrencyId': fiatCurrencyId,
        'amount': amount,
        'amountCurrencyId': amountCurrencyId,
      },
    );

    final data = response['data'];
    if (data is! Map<String, dynamic> || data.isEmpty) {
      throw NoDataException();
    }
    return Recommendation.fromJson(response);
  }
}

/// Provides an instance of [QuoteRepository].
final quoteRepositoryProvider = Provider<QuoteRepository>((ref) {
  final apiClient = ref.watch(apiClientProvider);
  return QuoteRepository(apiClient: apiClient);
});

/// Provides a [Recommendation] based on the provided [GetRecommendationsParams].
final recommendationsProvider = FutureProvider.autoDispose
    .family<Recommendation?, GetRecommendationsParams>((
  ref,
  GetRecommendationsParams params,
) async {
  if (params.amount.isNotEmpty) {
    final repo = ref.watch(quoteRepositoryProvider);
    return repo.getRecommendations(
      type: params.type,
      cryptoCurrencyId: params.cryptoCurrencyId,
      fiatCurrencyId: params.fiatCurrencyId,
      amount: params.amount,
      amountCurrencyId: params.amountCurrencyId,
    );
  }
  return null;
});
