import 'package:elevate_super_fitness/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class NavItemCustomWidget extends StatelessWidget {
  final String image;
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  const NavItemCustomWidget({
    super.key,
    required this.image,
    required this.label,
    this.isActive = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
        padding: EdgeInsets.symmetric(vertical: isActive ? 6 : 14, horizontal: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              image,
              width: 24,
              height: 24,
              color: isActive ? AppColors.mainColorL : AppColors.pureWhite,
            ),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              transitionBuilder: (child, anim) => FadeTransition(
                opacity: anim,
                child: SizeTransition(
                  sizeFactor: anim,
                  axisAlignment: -1,
                  child: child,
                ),
              ),
              child: isActive
                  ? Padding(
                      key: const ValueKey('label'),
                      padding: const EdgeInsets.only(top: 4),
                      child: Text(
                        label,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: AppColors.mainColorL,
                        ),
                      ),
                    )
                  : const SizedBox.shrink(key: ValueKey('empty')),
            ),
          ],
        ),
      ),
    );
  }
}
