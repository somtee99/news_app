import 'package:NewsApp/templates/article_template.dart';
import 'package:flutter/material.dart';
import '../model/article_model.dart';
import '../operations/request.dart';
import '../templates/article_template.dart';
import 'dart:core';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Article> articles;
  var currentDate = DateTime.now();
  String text = 'Loading please wait...';

  void getArticles() async {
    Request request = new Request();
    String month = currentDate.month.toString();
    String day = currentDate.day.toString();
    String year = currentDate.year.toString();
    String date = '{$year}-{$month}-{$day}';

    articles = await request.getArticles(date);
    if (articles == null) {
      setState(() {
        text = 'no articles available';
      });
    }

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getArticles();
  }

  @override
  Widget build(BuildContext context) {
    var dimension = MediaQuery.of(context).size;
    return Scaffold(
      body: articles == null
          ? Text(text)
          : Container(
              margin: EdgeInsets.fromLTRB(
                dimension.width * 0.05,
                0,
                dimension.width * 0.05,
                0,
              ),
              child: ListView.builder(
                itemCount: articles.length,
                itemBuilder: (context, index) {
                  return ArticleTemplate(articles[index]);
                },
              ),
            ),
    );
  }
}
