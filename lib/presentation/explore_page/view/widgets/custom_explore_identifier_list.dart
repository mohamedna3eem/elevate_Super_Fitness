import 'package:elevate_super_fitness/core/constants/widgets_keys.dart';
import 'package:elevate_super_fitness/generated/l10n.dart';
import 'package:flutter/material.dart';

class CustomExploreIdentifierList extends StatelessWidget {
  const CustomExploreIdentifierList({
    super.key,
    required this.title,
    this.onTap,
  });
  final String title;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final local = AppLocalizations.of(context);
    return Row(
      key: const Key(WidgetsKeys.kExploreScreenIdentifierWidgetKey),
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          key: const Key(WidgetsKeys.kExploreScreenIdentifierTitleKey),
          title,
          style: theme.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w600,
            color: theme.colorScheme.onSecondary,
          ),
        ),
        if (onTap != null)
          GestureDetector(
            key: const Key(WidgetsKeys.kExploreScreenIdentifierSubtitleKey),
            onTap: () => onTap,
            child: Text(
              local.seeAll,
              style: theme.textTheme.headlineSmall?.copyWith(
                color: theme.colorScheme.primary,
                decoration: TextDecoration.underline,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
      ],
    );
  }
}
