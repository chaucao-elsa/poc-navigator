import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:poc_navigator/navigation/elsa_navigator.dart';

import '../navigation/base_screen.dart';

class HomeScreen extends BaseStatefulScreen {
  final StatefulNavigationShell navigationShell;

  const HomeScreen({
    super.key,
    required super.screenParams,
    required this.navigationShell,
  });

  @override
  String get screenName => 'Home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 2,
      vsync: this,
      initialIndex: widget.navigationShell.currentIndex,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        bottom: TabBar(
          controller: _tabController,
          onTap: (index) {
            widget.navigationShell.goBranch(index);
          },
          tabs: const [
            Tab(text: 'Home'),
            Tab(text: 'Learn'),
          ],
        ),
      ),
      drawer: NavigationDrawer(
        children: [
          ListTile(
            title: const Text('Home'),
            onTap: () {
              Navigator.of(context).pop();
              context.go('/home');
            },
          ),
          ListTile(
            title: const Text('Learn'),
            onTap: () async {
              Navigator.of(context).pop();
              final returnValue = await ElsaNavigator.goPath(context, '/learn');
              showSnackBar('Returned from Learn: $returnValue');
            },
          ),
          ListTile(
            title: const Text('Discover'),
            onTap: () async {
              Navigator.of(context).pop();
              final returnValue =
                  await ElsaNavigator.goPath(context, '/discover');
              showSnackBar('Returned from Discover: $returnValue');
            },
          ),
          ListTile(
            title: const Text('Leaderboard'),
            onTap: () async {
              Navigator.of(context).pop();
              final returnValue =
                  await ElsaNavigator.goPath(context, '/leaderboard');
              final counter = returnValue?.data['counter'];
              showSnackBar('Counter: $counter');
            },
          ),
          ListTile(
            title: const Text('Profile'),
            onTap: () async {
              Navigator.of(context).pop();
              final returnValue =
                  await ElsaNavigator.goPath(context, '/profile');
              showSnackBar('Returned from Profile: $returnValue');
            },
          ),
        ],
      ),
      body: widget.navigationShell,
    );
  }

  void showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
