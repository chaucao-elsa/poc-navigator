import 'package:flutter/material.dart';
import 'package:poc_navigator/navigation/elsa_navigator.dart';
import 'package:poc_navigator/screens/learn_screen.dart';

import '../navigation/base_screen.dart';

class HomeScreen extends BaseStatefulScreen {
  const HomeScreen({super.key, required super.screenParams});

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
    _tabController = TabController(length: 2, vsync: this);
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
            onTap: () {},
          ),
          ListTile(
            title: const Text('Learn'),
            onTap: () async {
              Navigator.of(context).pop();
              final returnValue = await ElsaNavigator.goPath(context, '/learn');
              showSnackBar('Returned from Discover: $returnValue');
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
              showSnackBar('Returned from Discover: $returnValue');
            },
          ),
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // Home tab content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Home Tab Content'),
                Text('Current path: ${widget.screenParams.path}'),
                Text('From: ${widget.screenParams.from}'),
                Text('Query params: ${widget.screenParams.queryData}'),
              ],
            ),
          ),
          // Learn tab content
          LearnScreenBody(
            path: '/learn',
            from: 'Home',
            queryData: const {'query': 'learn'},
            completeLearningCallBack: () => _tabController.animateTo(0),
          ),
        ],
      ),
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
