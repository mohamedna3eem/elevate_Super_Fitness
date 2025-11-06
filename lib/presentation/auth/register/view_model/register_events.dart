import '../../../../core/enums/goal_enum.dart';
import '../../../../core/enums/level_enum.dart';

sealed class RegisterEvents {}

class ToggleRegisterPasswordVisibilityEvent extends RegisterEvents {}

class ToggleRegisterGenderEvent extends RegisterEvents {}

class ChangeRegisterAgeEvent extends RegisterEvents {
  final int age;

  ChangeRegisterAgeEvent(this.age);
}

class ChangeRegisterWeightEvent extends RegisterEvents {
  final int weight;

  ChangeRegisterWeightEvent(this.weight);
}

class ChangeRegisterHeightEvent extends RegisterEvents {
  final int height;

  ChangeRegisterHeightEvent(this.height);
}

class ChangeRegisterGoalEvent extends RegisterEvents {
  final GoalEnum goal;

  ChangeRegisterGoalEvent(this.goal);
}

class ChangeRegisterLevelEvent extends RegisterEvents {
  final LevelEnum level;

  ChangeRegisterLevelEvent(this.level);
}

class RegisterNextPageEvent extends RegisterEvents {}

class RegisterPreviousPageEvent extends RegisterEvents {}

class ChangeRegisterPageEvent extends RegisterEvents {
  final int page;

  ChangeRegisterPageEvent(this.page);
}
