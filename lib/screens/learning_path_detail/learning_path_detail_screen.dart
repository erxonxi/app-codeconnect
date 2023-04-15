import 'package:flutter/material.dart';

import '../../models/learning_path.dart';
import 'widgets/skill_node_item.dart';

class LearningPathDetailScreen extends StatelessWidget {
  final LearningPath path;

  const LearningPathDetailScreen({
    super.key,
    required this.path,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(path.title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                path.description,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 20),
              const Text(
                'Skills to Learn:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              ...path.skillNodes
                  .map((skillNode) => SkillNodeItem(skillNode: skillNode))
                  .toList(),
            ],
          ),
        ),
      ),
    );
  }
}
