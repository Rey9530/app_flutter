import 'package:flutter/material.dart';

import 'package:components/src/pages/alerts_page.dart';
import 'package:components/src/pages/avatar_page.dart';
import 'package:components/src/pages/home_page.dart';
import 'package:components/src/pages/animated_container.dart';
import 'package:components/src/pages/card_page.dart';
import 'package:components/src/pages/input_page.dart';

Map<String, WidgetBuilder> GetAplicationsRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => HomePage(),
    'alert': (BuildContext context) => AlertsPage(),
    'avatar': (BuildContext context) => AvatartPage(),
    'card': (BuildContext context) => CardPage(),
    'animated_cointeiner': (BuildContext context) => AnimatedContainerPage(),
    'inputs': (BuildContext context) => InputsPage(),
  };
}
