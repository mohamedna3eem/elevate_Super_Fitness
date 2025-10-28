import 'package:elevate_super_fitness/core/constants/widgets_keys.dart';
import 'package:elevate_super_fitness/generated/l10n.dart';
import 'package:elevate_super_fitness/presentation/explore_page/view/widgets/custom_explore_header_info.dart';
import 'package:elevate_super_fitness/presentation/explore_page/view/widgets/custom_explore_identifier_list.dart';
import 'package:elevate_super_fitness/presentation/explore_page/view/widgets/custom_explore_tab_bar_item.dart';
import 'package:elevate_super_fitness/presentation/explore_page/view/widgets/custom_popular_training_item.dart';
import 'package:elevate_super_fitness/presentation/explore_page/view/widgets/custom_recommendation_item.dart';
import 'package:elevate_super_fitness/presentation/explore_page/view/widgets/list_of_category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExplorePageBody extends StatelessWidget {
  const ExplorePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context);
    final heightMediaQuery = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: SizedBox(height: 24.h)),
          const SliverToBoxAdapter(child: CustomExploreHeaderInfo()),
          SliverToBoxAdapter(child: SizedBox(height: 24.h)),
          SliverToBoxAdapter(
            child: CustomExploreIdentifierList(title: local.category),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 8.h)),
          const SliverToBoxAdapter(
            child: ListOfCategory(
              key: Key(WidgetsKeys.kExploreScreenListCategoryItemKey),
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 24.h)),
          SliverToBoxAdapter(
            child: CustomExploreIdentifierList(
              title: local.recommendationToDay,
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 8.h)),
          SliverToBoxAdapter(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight: heightMediaQuery * 0.15,
                  ),
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) =>
                        const CustomRecommendationItem(),
                    separatorBuilder: (_, _) => SizedBox(width: 16.w),
                    itemCount: 10,
                  ),
                );
              },
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 24.h)),
          SliverToBoxAdapter(
            child: CustomExploreIdentifierList(
              title: local.upcomingWorkouts,
              onTap: () {},
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 8.h)),
          SliverToBoxAdapter(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * 0.045,
              ),
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) =>
                    CustomExploreTabBarItem(isActive: index == 0),
                separatorBuilder: (_, _) => SizedBox(width: 16.w),
                itemCount: 10,
              ),
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 8.h)),
          SliverToBoxAdapter(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxHeight: heightMediaQuery * 0.125),
              child: ListView.separated(
                key: const Key(WidgetsKeys.kExploreScreenListTabBarItemsKey),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) =>
                    const CustomRecommendationItem(border: false),
                separatorBuilder: (_, _) => SizedBox(width: 16.w),
                itemCount: 10,
              ),
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 24.h)),
          SliverToBoxAdapter(
            child: CustomExploreIdentifierList(
              title: local.recommendationForYou,
              onTap: () {},
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 8.h)),
          SliverToBoxAdapter(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight: heightMediaQuery * 0.15,
                  ),
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) =>
                        const CustomRecommendationItem(),
                    separatorBuilder: (_, _) => SizedBox(width: 16.w),
                    itemCount: 10,
                  ),
                );
              },
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 24.h)),
          SliverToBoxAdapter(
            child: CustomExploreIdentifierList(
              title: local.popularTraining,
              onTap: () {},
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 8.h)),
          SliverToBoxAdapter(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight: heightMediaQuery * 0.2,
                  ),
                  child: ListView.separated(
                    key: const Key(
                      WidgetsKeys.kExploreScreenListPopularTrainingItemsKey,
                    ),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) =>
                        const CustomPopularTrainingItem(),
                    separatorBuilder: (_, _) => SizedBox(width: 16.w),
                    itemCount: 10,
                  ),
                );
              },
            ),
          ),
          SliverToBoxAdapter(child: SizedBox(height: 40.h)),
        ],
      ),
    );
  }
}
