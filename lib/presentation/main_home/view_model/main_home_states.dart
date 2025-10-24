import 'package:equatable/equatable.dart';

class MainHomeStates extends Equatable {
  final int selectedIndex;
  final bool isBottomBarVisible;

  const MainHomeStates({
    this.selectedIndex = 0,
    this.isBottomBarVisible = true,
  });

  MainHomeStates copyWith({int? selectedIndex, bool? isBottomBarVisible}) {
    return MainHomeStates(
      selectedIndex: selectedIndex ?? this.selectedIndex,
      isBottomBarVisible: isBottomBarVisible ?? this.isBottomBarVisible,
    );
  }

  @override
  List<Object?> get props => [selectedIndex, isBottomBarVisible];
}
