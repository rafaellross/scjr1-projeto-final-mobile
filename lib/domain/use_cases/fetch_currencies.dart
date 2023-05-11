import 'package:scjr1_projeto_final_mobile/domain/entities/currency_entity.dart';

abstract class FetchCurrencies {
  Future<List<CurrencyEntity>> execute();
}