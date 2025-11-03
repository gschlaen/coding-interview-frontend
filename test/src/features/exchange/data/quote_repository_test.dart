import 'package:el_dorado_exchange/src/core/api/api_client.dart';
import 'package:el_dorado_exchange/src/features/exchange/data/quote_repository.dart';
import 'package:el_dorado_exchange/src/features/exchange/domain/recommendation.dart';
import 'package:el_dorado_exchange/src/exceptions/app_exception.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockApiClient extends Mock implements ApiClient {}

void main() {
  late QuoteRepository quoteRepository;
  late MockApiClient mockApiClient;

  setUp(() {
    mockApiClient = MockApiClient();
    quoteRepository = QuoteRepository(apiClient: mockApiClient);
  });

  group('QuoteRepository', () {
    const type = 1;
    const cryptoCurrencyId = 'TATUM-TRON-USDT';
    const fiatCurrencyId = 'BRL';
    const amount = '100';
    const amountCurrencyId = 'BRL';

    test('getRecommendations returns a Recommendation on success', () async {
      final recommendationJson = {
        'data': {
          'byPrice': {
            'fiatToCryptoExchangeRate': '0.9',
            'offerMakerStats': {'releaseTime': 10.0}
          }
        }
      };

      when(() => mockApiClient.get(
            any(),
            queryParameters: any(named: 'queryParameters'),
          )).thenAnswer((_) async => recommendationJson);

      final result = await quoteRepository.getRecommendations(
        type: type,
        cryptoCurrencyId: cryptoCurrencyId,
        fiatCurrencyId: fiatCurrencyId,
        amount: amount,
        amountCurrencyId: amountCurrencyId,
      );

      expect(result, isA<Recommendation>());
    });

    test('getRecommendations throws NoDataException when data is empty', () async {
      when(() => mockApiClient.get(
            any(),
            queryParameters: any(named: 'queryParameters'),
          )).thenAnswer((_) async => {'data': {}});

      expect(
        () => quoteRepository.getRecommendations(
          type: type,
          cryptoCurrencyId: cryptoCurrencyId,
          fiatCurrencyId: fiatCurrencyId,
          amount: amount,
          amountCurrencyId: amountCurrencyId,
        ),
        throwsA(isA<NoDataException>()),
      );
    });

    test('getRecommendations throws a generic Exception on API failure', () async {
      when(() => mockApiClient.get(
            any(),
            queryParameters: any(named: 'queryParameters'),
          )).thenThrow(Exception('API Error'));

      expect(
        () => quoteRepository.getRecommendations(
          type: type,
          cryptoCurrencyId: cryptoCurrencyId,
          fiatCurrencyId: fiatCurrencyId,
          amount: amount,
          amountCurrencyId: amountCurrencyId,
        ),
        throwsA(isA<Exception>()),
      );
    });
  });
}
