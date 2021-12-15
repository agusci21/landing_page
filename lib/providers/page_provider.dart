import 'package:flutter/material.dart';

class PageProvider extends ChangeNotifier {
  PageController scrollController = PageController();

  goTo(int index){
    scrollController.animateToPage(index, duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
  }
}
