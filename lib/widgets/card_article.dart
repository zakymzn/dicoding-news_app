import 'package:flutter/material.dart';
import 'package:news_app/common/navigation.dart';
import 'package:news_app/common/styles.dart';
import 'package:news_app/data/model/article.dart';
import 'package:news_app/provider/database_provider.dart';
import 'package:news_app/ui/article_detail_page.dart';
import 'package:provider/provider.dart';

class CardArticle extends StatelessWidget {
  final Article article;

  const CardArticle({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Consumer<DatabaseProvider>(
      builder: (context, provider, child) => FutureBuilder<bool>(
        future: provider.isBookmarked(article.url),
        builder: (context, snapshot) {
          var isBookmarked = snapshot.data ?? false;
          return Material(
            color: primaryColor,
            child: ListTile(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              leading: Hero(
                tag: article.urlToImage!,
                child: Image.network(
                  article.urlToImage!,
                  width: 100,
                ),
              ),
              title: Text(
                article.title,
              ),
              subtitle: Text(article.author ?? ""),
              trailing: isBookmarked
                  ? IconButton(
                      onPressed: () => provider.removeBookmark(article.url),
                      icon: Icon(Icons.bookmark),
                      color: Theme.of(context).colorScheme.secondary)
                  : IconButton(
                      onPressed: () => provider.addBookmark(article),
                      icon: Icon(Icons.bookmark_border),
                      color: Theme.of(context).colorScheme.secondary,
                    ),
              onTap: () => Navigation.intentWithData(
                  ArticleDetailPage.routeName, article),
            ),
          );
        },
      ),
    );
  }
}
