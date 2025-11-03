import 'package:el_dorado_exchange/src/features/exchange/domain/currency.dart';
import 'package:el_dorado_exchange/src/features/exchange/domain/exchange_card_state.dart';
import 'package:el_dorado_exchange/src/features/exchange/presentation/exchange_card_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ExchangeCardController', () {
    late ProviderContainer container;

    setUp(() {
      container = ProviderContainer();
    });

    tearDown(() {
      container.dispose();
    });

    test('initial state is correct', () {
      final controller = container.read(exchangeCardControllerProvider.notifier);
      expect(controller.state, ExchangeCardState.initial());
    });

    test('swapCurrencies changes exchangeType', () async {
      final controller = container.read(exchangeCardControllerProvider.notifier);

      controller.swapCurrencies();
      await Future.delayed(const Duration(milliseconds: 501));
      expect(controller.state.exchangeType, ExchangeType.cryptoToFiat);

      controller.swapCurrencies();
      await Future.delayed(const Duration(milliseconds: 501));
      expect(controller.state.exchangeType, ExchangeType.fiatToCrypto);
    });

    test('updateCurrency updates the correct currency', () async {
      final controller = container.read(exchangeCardControllerProvider.notifier);

      controller.updateCurrency(FiatCurrency.cop);
      await Future.delayed(const Duration(milliseconds: 501));
      expect(controller.state.fiatCurrency, FiatCurrency.cop);

      controller.updateCurrency(CryptoCurrency.usdt);
      await Future.delayed(const Duration(milliseconds: 501));
      expect(controller.state.cryptoCurrency, CryptoCurrency.usdt);
    });

    test('updateAmount updates the amountText', () async {
      final controller = container.read(exchangeCardControllerProvider.notifier);

      controller.updateAmount('123');
      await Future.delayed(const Duration(milliseconds: 501));
      expect(controller.state.amountText, '123');
    });
  });
}
