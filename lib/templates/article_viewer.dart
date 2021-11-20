import 'dart:async';

import 'package:NewsApp/model/article_model.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleViewer extends StatefulWidget {
  final Article article;
  ArticleViewer({this.article});

  @override
  _ArticleViewerState createState() => _ArticleViewerState();
}

class _ArticleViewerState extends State<ArticleViewer> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            widget.article.title,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        body: WebView(
          initialUrl: widget.article.url,
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            _controller.complete(webViewController);
          },
        ),
      ),
    );
  }
}
