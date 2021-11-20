import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import '../model/article_model.dart';

class Request {
  String apiUrl = 'http://newsapi.org/v2/';
  String apiKey = 'b310a34883fd486d85d6ed9b61129def';

  Future<List<Article>> getArticles(String currentDate) async {
    String url = apiUrl +
        'everything?q=bitcoin&from=' +
        currentDate +
        '&sortBy=publishedAt&apiKey=$apiKey';
    var header = {'accept': 'application/json'};

    return await http
        .get(
      url,
      headers: header,
    )
        .then((response) {
      if (response.statusCode == 200) {
        var returnObject = convert.json.decode(response.body);
        var articles = returnObject['articles'] as List;
        return articles.map((e) => Article.fromJson(e)).toList();
      } else {
        return null;
      }
    });
  }
}
