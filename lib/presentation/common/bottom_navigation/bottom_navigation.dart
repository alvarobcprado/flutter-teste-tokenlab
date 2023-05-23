// Flutter imports:
import 'package:firebase_analytics/firebase_analytics.dart';
// Package imports:
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Project imports:
import '../../../intl_commons.dart';
import '../../movies/list/favorites_list/favorites_view.dart';
import '../../movies/list/movies_list/home_view.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _currentIndex = 0;
  final List<GlobalKey<NavigatorState>> _keys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
  ];

  late final List<Widget> _pages = [
    Navigator(
      key: _keys[0],
      initialRoute: HomeView.routeName,
      observers: <NavigatorObserver>[
        FirebaseAnalyticsObserver(
          analytics: context.read<FirebaseAnalytics>(),
        ),
      ],
      onGenerateRoute: (settings) =>
          _routeMatcher(context, settings.name, settings),
    ),
    Navigator(
      key: _keys[1],
      initialRoute: FavoritesView.routeName,
      observers: <NavigatorObserver>[
        FirebaseAnalyticsObserver(
          analytics: context.read<FirebaseAnalytics>(),
        ),
      ],
      onGenerateRoute: (settings) =>
          _routeMatcher(context, settings.name, settings),
    ),
  ];

  void _handleBottomNavbarTap(int newIndex) {
    newIndex != _currentIndex
        ? setState(() => _currentIndex = newIndex)
        : _keys[_currentIndex].currentState?.popUntil((route) => route.isFirst);
  }

  Route<dynamic>? _routeMatcher(context, routeName, routeSettings) =>
      FluroRouter.appRouter
          .matchRoute(context, routeName, routeSettings: routeSettings)
          .route;

  @override
  Widget build(BuildContext context) => WillPopScope(
        onWillPop: () async =>
            !await _keys[_currentIndex].currentState!.maybePop(),
        child: Scaffold(
          body: IndexedStack(
            index: _currentIndex,
            children: _pages,
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: _handleBottomNavbarTap,
            items: [
              BottomNavigationBarItem(
                icon: const Icon(Icons.movie),
                label: S.of(context).bottom_navbar_movies,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.favorite),
                label: S.of(context).bottom_navbar_favorites,
              ),
            ],
          ),
        ),
      );
}
