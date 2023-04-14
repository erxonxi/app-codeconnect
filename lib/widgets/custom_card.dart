import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final bool isActive;
  final Widget child;
  final VoidCallback press;

  const CustomCard({
    super.key,
    required this.isActive,
    required this.child,
    required this.press,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    const kDefaultPadding = 20.0;
    final kPrimaryColor = theme.primaryColor;
    final kBgDarkColor = Colors.grey[100];

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
                child: child,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
