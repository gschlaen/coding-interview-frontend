abstract class Currency {
  const Currency({
    required this.id,
    required this.name,
    required this.description,
    required this.iconAsset,
  });

  final String id;
  final String name;
  final String description;
  final String iconAsset;
}

enum FiatCurrency implements Currency {
  brl(
    id: 'BRL',
    name: 'BRL',
    description: 'Real Brasileño (R\$)',
    iconAsset: 'assets/fiat_currencies/BRL.png',
  ),

  cop(
    id: 'COP',
    name: 'COP',
    description: 'Pesos Colombianos (COL\$)',
    iconAsset: 'assets/fiat_currencies/COP.png',
  ),

  pen(
    id: 'PEN',
    name: 'PEN',
    description: 'Soles Peruanos (S/)',
    iconAsset: 'assets/fiat_currencies/PEN.png',
  ),

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

enum CryptoCurrency implements Currency {
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
