import 'package:flutter/material.dart';

import '../create_post/create_post_screen.dart';
import 'widgets/curved_navigation_bar/curved_navigation_bar.dart';
import 'widgets/home_tab_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});

  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    bool isMobile = mediaQuery.size.width < 600;

    List<String> titles = [
      'Home',
      'Learning Paths',
      'Communities',
      'Challenges',
    ];

    String title = titles[_tabController.index];

    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.title} | $title'),
      ),
      body: HomeTabView(tabController: _tabController),
      drawer: isMobile ? null : buildDrawer(),
      bottomNavigationBar: isMobile ? buildBottomNavigationBar() : null,
      floatingActionButton: buildFloatingActionButton(),
    );
  }

  Drawer buildDrawer() {
    final theme = Theme.of(context);

    return Drawer(
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
    );
  }

  Widget buildFloatingActionButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14.0),
      child: FilledButton(
        style: ButtonStyle(
          padding: MaterialStateProperty.all(
            const EdgeInsets.all(12.0),
          ),
          shape: MaterialStateProperty.all(
            const CircleBorder(),
          ),
        ),
        onPressed: _visitCreatePostScreen,
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget buildBottomNavigationBar() {
    final theme = Theme.of(context);

    final icons = [
      Icons.home_rounded,
      Icons.school_rounded,
      Icons.people_rounded,
      Icons.emoji_events_rounded,
    ];

    Icon getIcon(int index) {
      return Icon(
        icons[index],
        color: theme.primaryIconTheme.color,
        size: 32,
      );
    }

    return CurvedNavigationBar(
      backgroundColor: Colors.transparent,
      color: theme.primaryColor,
      animationDuration: const Duration(milliseconds: 200),
      onTap: _onTabTapped,
      height: 60,
      items: [
        getIcon(0),
        getIcon(1),
        getIcon(2),
        getIcon(3),
      ],
    );
  }

  void _visitCreatePostScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const CreatePostScreen(),
      ),
    );
  }

  void _onTabTapped(int value) {
    setState(() {
      _tabController.index = value;
    });
  }
}
