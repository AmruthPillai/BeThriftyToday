import 'package:bethriftytoday/config/routes.dart';
import 'package:bethriftytoday/config/theme.dart';
import 'package:bethriftytoday/screens/splash.dart';
import 'package:bethriftytoday/services/auth.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FirebaseAnalytics analytics = FirebaseAnalytics();

    return MultiProvider(
      providers: [
        Provider<AuthService>(create: (_) => AuthService()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorObservers: [FirebaseAnalyticsObserver(analytics: analytics)],
        title: 'Be Thrifty Today',
        theme: theme,
        initialRoute: SplashScreen.routeName,
        routes: routes,
      ),
    );
  }
}
