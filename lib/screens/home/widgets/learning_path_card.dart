import 'package:flutter/material.dart';

import '../../../models/learning_path.dart';
import '../../../widgets/custom_card.dart';

class LearningPathCard extends StatelessWidget {
  final bool isActive;
  final LearningPath path;
  final VoidCallback press;

  const LearningPathCard({
    super.key,
    required this.isActive,
    required this.path,
    required this.press,
  });

  int _calculateProgress(List<SkillNode> skillNodes) {
    int totalSkills = 0;
    int completedSkills = 0;

    void countSkills(List<SkillNode> nodes) {
      for (SkillNode node in nodes) {
        totalSkills++;
        if (node.isCompleted) {
          completedSkills++;
        }
        if (node.children.isNotEmpty) {
          countSkills(node.children);
        }
      }
    }

    countSkills(skillNodes);

    if (totalSkills == 0) return 0;
    return ((completedSkills / totalSkills) * 100).round();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    const kDefaultPadding = 20.0;
    const kTextColor = Color(0xFF3C4046);

    int progress = _calculateProgress(path.skillNodes);

    return CustomCard(
      isActive: isActive,
      press: press,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(width: kDefaultPadding / 2),
          Text(
            path.title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: isActive ? Colors.white : kTextColor,
            ),
          ),
          const SizedBox(height: kDefaultPadding / 2),
          Text(
            path.description,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: isActive ? Colors.white : kTextColor,
            ),
          ),
          const SizedBox(height: kDefaultPadding / 2),
          LinearProgressIndicator(
            value: progress / 100,
            backgroundColor: isActive ? Colors.white.withOpacity(0.3) : theme.primaryColor.withOpacity(0.3),
            valueColor: AlwaysStoppedAnimation<Color>(
              isActive ? Colors.white : theme.primaryColor,
            ),
          ),
          const SizedBox(height: kDefaultPadding / 2),
          Text(
            '$progress% completed',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: isActive ? Colors.white : kTextColor,
            ),
          ),
        ],
      ),
    );
  }
}
