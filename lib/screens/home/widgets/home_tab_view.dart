import 'package:flutter/material.dart';

import '../views/home_view.dart';
import '../views/learning_paths_view.dart';
import '..//views/challenges_view.dart';
import '..//views/community_view.dart';

class HomeTabView extends StatelessWidget {
  const HomeTabView({
    super.key,
    required TabController tabController,
  }) : _tabController = tabController;

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      controller: _tabController,
      children: const [
        HomeView(),
        LearningPathsView(),
        CommunityView(),
        ChallengesView()
      ],
    );
  }
}
