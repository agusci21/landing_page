import 'package:flutter/material.dart';
import 'package:universal_html/html.dart' as html;

class PageProvider extends ChangeNotifier {
  PageController scrollController = PageController();

  final List<String> _pages = [
    'home',
    'about',
    'pricing',
    'contact',
    'location'
  ];

  createScrollController(String routeName) {
    scrollController = PageController(initialPage: getPageIndex(routeName));
  }

  int getPageIndex(String routeName) =>
      (!_pages.contains(routeName)) ? 0 : _pages.indexOf(routeName);

  goTo(int index) {
    html.window.history.pushState(null, 'None', '#/${_pages[index]}');
    scrollController.animateToPage(index,
        duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
  }
}
