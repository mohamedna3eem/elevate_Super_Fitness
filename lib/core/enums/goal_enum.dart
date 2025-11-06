import '../../generated/l10n.dart';

enum GoalEnum {
  gainWeight("Gain weight"),
  loseWeight("Lose weight"),
  getFitter("Get fitter"),
  gainMoreFlexible("Gain more flexible"),
  learnTheBasic("Learn the basic");

  final String value;

  const GoalEnum(this.value);
}

extension GoalEnumExtension on GoalEnum {
  String get displayName {
    switch (this) {
      case GoalEnum.gainWeight:
        return AppLocalizations().gainWeight;
      case GoalEnum.loseWeight:
        return AppLocalizations().loseWeight;
      case GoalEnum.getFitter:
        return AppLocalizations().getFitter;
      case GoalEnum.gainMoreFlexible:
        return AppLocalizations().gainMoreFlexible;
      case GoalEnum.learnTheBasic:
        return AppLocalizations().learnTheBasic;
    }
  }
}