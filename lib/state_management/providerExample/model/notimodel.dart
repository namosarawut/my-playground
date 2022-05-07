

import 'package:flutter/foundation.dart';

class NotiModel extends ChangeNotifier{
  String _text1 = 'Text1 in notiModel';

  String get text1 => _text1;

  set text1(String text1) {
    _text1 = text1;
  }
  String _text2 = 'Text2 in notiModel';

  String get text2 => _text2;

  set text2(String text2) {
    _text2 = text2;
    notifyListeners();
  }
}