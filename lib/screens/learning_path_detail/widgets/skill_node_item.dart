import 'package:flutter/material.dart';

import '../../../models/learning_path.dart';

class SkillNodeItem extends StatelessWidget {
  final SkillNode skillNode;

  const SkillNodeItem({
    super.key,
    required this.skillNode,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: ExpansionTile(
        initiallyExpanded: skillNode.isCompleted,
        title: Row(
          children: [
            Icon(
              skillNode.isCompleted
                  ? Icons.check_circle
                  : Icons.check_circle_outline,
              color: skillNode.isCompleted ? Colors.green : Colors.grey,
            ),
            const SizedBox(width: 8),
            Text(
              skillNode.title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        children: [
          Text(
            skillNode.description,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 16),
          ...skillNode.children
              .map((child) => SkillNodeItem(skillNode: child))
              .toList(),
        ],
      ),
    );
  }
}
