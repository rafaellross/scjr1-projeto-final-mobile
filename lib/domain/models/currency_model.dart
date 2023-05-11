import 'package:scjr1_projeto_final_mobile/domain/entities/currency_entity.dart';

class CurrencyModel {
  const CurrencyModel({
    required this.symbol,
    required this.description,

  });

  final String symbol;
  final String description;

  factory CurrencyModel.fromMap(Map<String, dynamic> map) => CurrencyModel(
        symbol: map[0],
        description: map[1],
      );

  CurrencyEntity toEntity() => CurrencyEntity(
        symbol: symbol,
        description: description
      );
}
