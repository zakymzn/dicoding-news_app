import 'package:flutter/widgets.dart';
import 'package:news_app/widgets/custom_scaffold.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleWebView extends StatelessWidget {
  static const routeName = '/article_web';

  final String url;

  const ArticleWebView({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text('News App'),
    //   ),
    //   body: WebView(
    //     initialUrl: url,
    //   ),
    // );
    return CustomScaffold(
      body: WebView(
        initialUrl: url,
      ),
    );
  }
}
