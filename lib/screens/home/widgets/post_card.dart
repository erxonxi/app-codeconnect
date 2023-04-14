import 'package:flutter/material.dart';

import '../../../models/post.dart';
import '../../../widgets/custom_card.dart';

class PostCard extends StatelessWidget {
  final bool isActive;
  final Post post;
  final VoidCallback press;

  const PostCard({
    super.key,
    required this.isActive,
    required this.post,
    required this.press,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    const kDefaultPadding = 20.0;
    const kTextColor = Color(0xFF3C4046);

    return CustomCard(
      isActive: isActive,
      press: press,
      child: Column(
        children: [
          Row(
            children: [
              const SizedBox(width: kDefaultPadding / 2),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 16,
                          backgroundImage: NetworkImage(
                            post.user.avatar ??
                                "https://eu.ui-avatars.com/api/?name=John+Doe&size=250",
                          ),
                        ),
                        const SizedBox(width: kDefaultPadding / 2),
                        Text(
                          post.user.nickname,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: isActive ? Colors.white : kTextColor,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: kDefaultPadding / 2),
                    Text(
                      post.content,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: isActive ? Colors.white : kTextColor,
                          ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: kDefaultPadding / 2),
          Align(
            alignment: Alignment.bottomRight,
            child: Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: post.tags
                  .map(
                    (tag) => Chip(
                      label: Text(tag),
                      backgroundColor:
                          isActive ? Colors.white : theme.primaryColor,
                      labelStyle: TextStyle(
                        color: isActive ? kTextColor : Colors.white,
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
