import 'package:flutter/material.dart';
import 'package:news_provider/src/services/news_service.dart';
import 'package:news_provider/src/widgets/lista_noticias.dart';
import 'package:provider/provider.dart';

class Tab1Page extends StatefulWidget {
  @override
  _Tab1PageState createState() => _Tab1PageState();
}

class _Tab1PageState extends State<Tab1Page>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    //Referencia al Provider
    final newsService = Provider.of<NewsService>(context);
    return Scaffold(
      body: (newsService.headlines.length == 0)
          ? Center(child: CircularProgressIndicator())
          : ListaNoticias(newsService.headlines),
    );
  }

  @override
  //Mantiene el estado de la pagina
  bool get wantKeepAlive => true;
}
