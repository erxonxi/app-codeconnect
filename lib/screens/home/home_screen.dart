import 'package:flutter/material.dart';

import 'widgets/curved_navigation_bar/curved_navigation_bar.dart';
import 'widgets/home_tab_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});

  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  int _counter = 0;

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final mediaQuery = MediaQuery.of(context);

    bool isMobile = mediaQuery.size.width < 600;

    String title = _tabController.index == 0
        ? 'Home'
        : _tabController.index == 1
            ? 'Learning Paths'
            : _tabController.index == 2
                ? 'Communities'
                : 'Challenges';

    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.title} | $title'),
      ),
      body: HomeTabView(tabController: _tabController, counter: _counter),
      drawer: isMobile
          ? null
          : Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  DrawerHeader(
                    decoration: BoxDecoration(
                      color: theme.primaryColor,
                    ),
                    child: const Center(
                      child: Text(
                        'CodeConnect',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                        ),
                      ),
                    ),
                  ),
                  // same as bottom navigation bar
                  ListTile(
                    leading: const Icon(Icons.home_rounded),
                    title: const Text('Home'),
                    onTap: () {
                      _onTabTapped(0);
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.school_rounded),
                    title: const Text('Learning Paths'),
                    onTap: () {
                      _onTabTapped(1);
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.people_rounded),
                    title: const Text('Communities'),
                    onTap: () {
                      _onTabTapped(2);
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.emoji_events_rounded),
                    title: const Text('Challenges'),
                    onTap: () {
                      _onTabTapped(3);
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
      bottomNavigationBar: isMobile ? buildBottomNavigationBar() : null,
      floatingActionButton: buildFloatingActionButton(),
    );
  }

  FloatingActionButton buildFloatingActionButton() {
    return FloatingActionButton(
      onPressed: _incrementCounter,
      tooltip: 'Increment',
      child: const Icon(Icons.add),
    );
  }

  Widget buildBottomNavigationBar() {
    final theme = Theme.of(context);

    return CurvedNavigationBar(
      backgroundColor: Colors.white,
      color: theme.primaryColor,
      animationDuration: const Duration(milliseconds: 200),
      onTap: _onTabTapped,
      height: 60,
      items: [
        Icon(Icons.home_rounded, color: theme.primaryIconTheme.color, size: 32),
        Icon(Icons.school_rounded,
            color: theme.primaryIconTheme.color, size: 32),
        Icon(Icons.people_rounded,
            color: theme.primaryIconTheme.color, size: 32),
        Icon(Icons.emoji_events_rounded,
            color: theme.primaryIconTheme.color, size: 32),
      ],
    );
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _onTabTapped(int value) {
    setState(() {
      _tabController.index = value;
    });
  }
}
