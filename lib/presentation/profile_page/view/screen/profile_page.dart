import 'package:elevate_super_fitness/presentation/main_home/view_model/main_home_events.dart';
import 'package:elevate_super_fitness/presentation/main_home/view_model/main_home_view_model.dart';
import 'package:flutter/material.dart';
class ProfilePage extends StatelessWidget {
  final MainHomeViewModel mainHomeViewModel;
  const ProfilePage({super.key, required this.mainHomeViewModel});

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      key: const ValueKey('profile page'),
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
      child: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Text(
                "profile page",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
