import 'package:NewsApp/templates/article_viewer.dart';
import 'package:flutter/material.dart';
import '../model/article_model.dart';

class ArticleTemplate extends StatefulWidget {
  final Article article;

  ArticleTemplate(this.article);
  @override
  _ArticleTemplateState createState() => _ArticleTemplateState();
}

class _ArticleTemplateState extends State<ArticleTemplate> {
  @override
  Widget build(BuildContext context) {
    var dimension = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ArticleViewer(
              article: widget.article,
            ),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.fromLTRB(0, 0, 0, dimension.height * 0.02),
        child: Card(
          color: Colors.deepOrange[100],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            height: dimension.height * 0.5,
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 5,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    child: widget.article.urlToImage == null
                        ? Image.asset(
                            'assets/no_image.png',
                            height: dimension.height * 0.25,
                            width: double.infinity,
                            fit: BoxFit.fitWidth,
                          )
                        : Image.network(
                            widget.article.urlToImage,
                            height: dimension.height * 0.25,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Container(
                    margin: EdgeInsets.fromLTRB(
                      dimension.width * 0.02,
                      dimension.height * 0.01,
                      dimension.width * 0.02,
                      dimension.height * 0.01,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          widget.article.title.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                        SizedBox(
                          height: dimension.height * 0.01,
                        ),
                        Text(widget.article.content.toString()),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
