import 'package:elevate_super_fitness/presentation/main_home/view_model/main_home_events.dart';
import 'package:elevate_super_fitness/presentation/main_home/view_model/main_home_view_model.dart';
import 'package:flutter/material.dart';

class ExplorePage extends StatelessWidget {
  final MainHomeViewModel mainHomeViewModel;
  const ExplorePage({super.key, required this.mainHomeViewModel});

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      key: const ValueKey('explore_page'),
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
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Container(height: 300, color: Colors.amber),
            // Container(height: 300, color: Colors.red),
            // Container(height: 300, color: Colors.green),
            // Container(height: 300, color: Colors.grey),
            Center(
              child: Text(
                "explore page",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
