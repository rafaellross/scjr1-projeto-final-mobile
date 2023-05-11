import 'dart:convert';
import 'package:http/http.dart';
import 'package:scjr1_projeto_final_mobile/domain/entities/currency_entity.dart';
import 'package:scjr1_projeto_final_mobile/domain/models/currency_model.dart';
import 'package:scjr1_projeto_final_mobile/domain/use_cases/fetch_currencies.dart';


class RemoteFetchCurrencies extends FetchCurrencies {
  @override
  Future<List<CurrencyEntity>> execute() async {
    try {
      final uri = Uri.parse('https://api.apilayer.com/exchangerates_data/symbols');
      final response = await Client().get(uri, headers: {"apikey": "xoET5vmFb5CAoEQ4mWqMwzSirR86xGwe"});
      final responseJson = jsonDecode(response.body);

      return responseJson['symbols']
          .map<CurrencyEntity>((map) => CurrencyModel.fromMap(map).toEntity())
          .toList();
    } catch (e) {
      return [];
    }
  }

}