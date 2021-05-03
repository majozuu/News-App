import 'package:flutter/material.dart';
import 'package:news_provider/src/pages/tab1_page.dart';
import 'package:news_provider/src/pages/tab2_page.dart';
import 'package:provider/provider.dart';

class TabsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => new _NavegacionModel(),
        child: Scaffold(body: _Paginas(), bottomNavigationBar: _Navegacion()));
  }
}

class _Navegacion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navegacionModel = Provider.of<_NavegacionModel>(context);
    return BottomNavigationBar(
      onTap: (i) => navegacionModel.paginaActual = i,
      currentIndex: navegacionModel.paginaActual,
      items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.person_outline), title: Text('Para ti')),
        BottomNavigationBarItem(
            icon: Icon(Icons.public), title: Text('Encabezados')),
      ],
    );
  }
}

class _Paginas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navegacionModel = Provider.of<_NavegacionModel>(context);
    return PageView(
      controller: navegacionModel.pageController,
      //physics: BouncingScrollPhysics(),
      //Desactivar el efecto
      physics: NeverScrollableScrollPhysics(),
      children: [Tab1Page(), Tab2Page()],
    );
  }
}

class _NavegacionModel with ChangeNotifier {
  PageController _pageController = new PageController();
  int _paginaActual = 0;
  int get paginaActual => this._paginaActual;
  set paginaActual(int valor) {
    _pageController.animateToPage(valor,
        duration: Duration(milliseconds: 250), curve: Curves.easeOut);
    this._paginaActual = valor;
    notifyListeners();
  }

  PageController get pageController => this._pageController;
}
