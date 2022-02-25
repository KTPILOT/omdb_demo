import 'package:dio/dio.dart';
import 'package:omdb_demo/model/search_model.dart';
import 'package:omdb_demo/utils/string_resources.dart';

class ApiServices {
  Future<SearchModel> getSearchData({required String title}) async {
    try {
      var response = await Dio()
          .get('https://www.omdbapi.com/?s=$title&${StringRes().apiKey}');
      print(response.data);
      return SearchModel.fromJson(response.data);
    } catch (e) {
      throw Exception(e);
    }
  }
}
