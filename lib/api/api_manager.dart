import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/api/api_constants.dart';
import 'package:news_app/model/NewsResponse.dart';
import 'package:news_app/model/SourceResponse.dart';

class ApiManager{
  static Future<SourceResponse?> getSources(String categoryId)async{
    Uri url = Uri.https(ApiConstatns.baseUrl,
    ApiConstatns.sourcesApi,
        {
          'apiKey' : '1788680dde344262a24b445947eec2db',
          'category' : categoryId
        });
    var response = await http.get(url);
    try{
      var responeBody = response.body;
      var json = jsonDecode(responeBody);
      return SourceResponse.fromJson(json);
    }
    catch(e){
      throw e ;
    }

  }
  
  static Future<NewsResponse?> getNewsBySourceId(String sourceId)async{
    Uri url = Uri.https(ApiConstatns.baseUrl,ApiConstatns.newsApi, {
      'apiKey' : '1788680dde344262a24b445947eec2db',
      'sources' : sourceId
    });
    var response = await http.get(url);
    try{
      return NewsResponse.fromJson(jsonDecode(response.body));

    }
    catch(e){
      throw e ;
    }
  }
}



//https://newsapi.org/v2/top-headlines/sources?apiKey=1788680dde344262a24b445947eec2db

// https://newsapi.org/v2/everything?q=bitcoin&apiKey=1788680dde344262a24b445947eec2db