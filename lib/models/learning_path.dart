class LearningPath {
  final String id;
  final String title;
  final String description;
  final List<SkillNode> skillNodes;

  LearningPath({
    required this.id,
    required this.title,
    required this.description,
    required this.skillNodes,
  });

  factory LearningPath.fromJson(Map<String, dynamic> json) {
    return LearningPath(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      skillNodes: json['skillNodes']
          .map<SkillNode>((skillNode) => SkillNode.fromJson(skillNode))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'skillNodes': skillNodes,
    };
  }
}

class SkillNode {
  final String id;
  final String title;
  final String description;
  final bool isCompleted;
  final List<SkillNode> children;

  SkillNode({
    required this.id,
    required this.title,
    required this.description,
    this.isCompleted = false,
    required this.children,
  });

  factory SkillNode.fromJson(Map<String, dynamic> json) {
    return SkillNode(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      isCompleted: json['isCompleted'],
      children: json['children']
          .map<SkillNode>((skillNode) => SkillNode.fromJson(skillNode))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'isCompleted': isCompleted,
      'children': children,
    };
  }
}
