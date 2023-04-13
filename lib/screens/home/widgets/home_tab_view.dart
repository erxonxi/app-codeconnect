import 'package:flutter/material.dart';

class HomeTabView extends StatelessWidget {
  const HomeTabView({
    super.key,
    required TabController tabController,
    required int counter,
  }) : _tabController = tabController, _counter = counter;

  final TabController _tabController;
  final int _counter;

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      controller: _tabController,
      children: [
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              Text(
                '$_counter',
              ),
            ],
          ),
        ),
        const Center(
          child: Text(
            'Second Tab',
          ),
        ),
        const Center(
          child: Text(
            'Third Tab',
          ),
        ),
        const Center(
          child: Text(
            'Fourth Tab',
          ),
        )
      ],
    );
  }
}
