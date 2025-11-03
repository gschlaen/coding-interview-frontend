/// Represents a currency, either fiat or crypto.
abstract class Currency {
  /// Creates a [Currency].
  const Currency({
    required this.id,
    required this.name,
    required this.description,
    required this.iconAsset,
  });

  /// The unique identifier of the currency.
  final String id;

  /// The name of the currency.
  final String name;

  /// A description of the currency.
  final String description;

  /// The path to the icon asset for the currency.
  final String iconAsset;
}

/// Represents a fiat currency.
enum FiatCurrency implements Currency {
  /// Brazilian Real
  brl(
    id: 'BRL',
    name: 'BRL',
    description: 'Real Brasileño (R\$)',
    iconAsset: 'assets/fiat_currencies/BRL.png',
  ),

  /// Colombian Peso
  cop(
    id: 'COP',
    name: 'COP',
    description: 'Pesos Colombianos (COL\$)',
    iconAsset: 'assets/fiat_currencies/COP.png',
  ),

  /// Peruvian Sol
  pen(
    id: 'PEN',
    name: 'PEN',
    description: 'Soles Peruanos (S/)',
    iconAsset: 'assets/fiat_currencies/PEN.png',
  ),

  /// Venezuelan Bolivar
  ves(
    id: 'VES',
    name: 'VES',
    description: 'Bolívares (Bs)',
    iconAsset: 'assets/fiat_currencies/VES.png',
  );

  @override
  final String id;
  @override
  final String name;
  @override
  final String description;
  @override
  final String iconAsset;

  const FiatCurrency({
    required this.id,
    required this.name,
    required this.description,
    required this.iconAsset,
  });
}

/// Represents a crypto currency.
enum CryptoCurrency implements Currency {
  /// Tether
  usdt(
    id: 'TATUM-TRON-USDT',
    name: 'USDT',
    description: 'Tether (USDT)',
    iconAsset: 'assets/cripto_currencies/TATUM-TRON-USDT.png',
  );

  const CryptoCurrency({
    required this.id,
    required this.name,
    required this.description,
    required this.iconAsset,
  });

  @override
  final String id;
  @override
  final String name;
  @override
  final String description;
  @override
  final String iconAsset;
}
