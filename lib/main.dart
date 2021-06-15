import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

//import 'package:components/src/pages/home_temp.dart';
import 'package:components/src/pages/alerts_page.dart';
import 'package:components/src/routes/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Componentes',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', 'US'),
        const Locale('es', 'ES'),
      ],
      initialRoute: '/',
      //home: HomePage(),
      routes: GetAplicationsRoutes(),
      onGenerateRoute: (RouteSettings setting) {
        return MaterialPageRoute(
            builder: (BuildContext context) => AlertsPage());
      },
    );
  }
}
