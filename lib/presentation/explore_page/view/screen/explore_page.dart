import 'package:elevate_super_fitness/core/constants/widgets_keys.dart';
import 'package:elevate_super_fitness/presentation/explore_page/view/widgets/explore_page_body.dart';
import 'package:elevate_super_fitness/presentation/main_home/view_model/main_home_events.dart';
import 'package:elevate_super_fitness/presentation/main_home/view_model/main_home_view_model.dart';
import 'package:flutter/material.dart';

class ExplorePage extends StatelessWidget {
  final MainHomeViewModel mainHomeViewModel;
  const ExplorePage({super.key, required this.mainHomeViewModel});

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      key: const Key(WidgetsKeys.kExploreScreenMainKey),
      onNotification: (notification) {
        if (notification is ScrollUpdateNotification) {
          mainHomeViewModel.doIntent(
            OnScrollUpdateEvent(
              notification.metrics.pixels,
              notification.scrollDelta ?? 0,
            ),
          );
        }
        return true;
      },
      child: const ExplorePageBody(),
    );
  }
}
