part of 'explore_view_model_cubit.dart';

class ExploreViewModelState extends Equatable {
  const ExploreViewModelState({
    this.userInfo,
    this.randomMuscles,
    this.musclesGroup,
    this.musclesGroupDetailsById,
    this.mealsCategory,
  });
  final BaseState<UserInfoEntity>? userInfo;
  final BaseState<MusclesResponseEntity>? randomMuscles;
  final BaseState<MusclesGroupResponseEntity>? musclesGroup;
  final BaseState<MuscleGroupDetailsEntity>? musclesGroupDetailsById;
  final BaseState<MealsCategoriesResponseEntity>? mealsCategory;
  ExploreViewModelState copyWith({
    BaseState<UserInfoEntity>? userInfo,
    BaseState<MusclesResponseEntity>? randomMuscles,
    BaseState<MusclesGroupResponseEntity>? musclesGroup,
    BaseState<MuscleGroupDetailsEntity>? musclesGroupDetailsById,
    BaseState<MealsCategoriesResponseEntity>? mealsCategory,
  }) {
    return ExploreViewModelState(
      userInfo: userInfo ?? this.userInfo,
      randomMuscles: randomMuscles ?? this.randomMuscles,
      musclesGroup: musclesGroup ?? this.musclesGroup,
      musclesGroupDetailsById:
          musclesGroupDetailsById ?? this.musclesGroupDetailsById,
      mealsCategory: mealsCategory ?? this.mealsCategory,
    );
  }

  @override
  List<Object?> get props => [
    userInfo,
    randomMuscles,
    musclesGroup,
    musclesGroupDetailsById,
    mealsCategory,
  ];
}
