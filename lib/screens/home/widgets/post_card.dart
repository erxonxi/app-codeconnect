import 'package:flutter/material.dart';

import '../../../models/post.dart';

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
    final kPrimaryColor = theme.primaryColor;
    final kBgDarkColor = Colors.grey[100];
    const kTextColor = Color(0xFF3C4046);

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: kDefaultPadding,
        vertical: kDefaultPadding / 2,
      ),
      child: InkWell(
        onTap: press,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    offset: const Offset(4.0, 4.0),
                    blurRadius: 10.0,
                    spreadRadius: 1.0,
                  ),
                  const BoxShadow(
                    color: Colors.white,
                    offset: Offset(-4.0, -4.0),
                    blurRadius: 10.0,
                    spreadRadius: 1.0,
                  ),
                ],
              ),
              child: Container(
                padding: const EdgeInsets.all(kDefaultPadding),
                decoration: BoxDecoration(
                  color: isActive ? kPrimaryColor : kBgDarkColor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const SizedBox(width: kDefaultPadding / 2),
                        Expanded(
                          child: Text.rich(
                            TextSpan(
                              text: "${post.title} \n",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: isActive ? Colors.white : kTextColor,
                              ),
                              children: [
                                TextSpan(
                                  text: post.user.email,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                        color: isActive
                                            ? Colors.white
                                            : kTextColor,
                                      ),
                                ),
                              ],
                            ),
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
