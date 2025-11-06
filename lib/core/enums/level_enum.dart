import '../../generated/l10n.dart';

enum LevelEnum {
  rookie("level1"),
  beginner("level2"),
  intermediate("level3"),
  advance("level4"),
  trueBeast("level5");

  final String value;

  const LevelEnum(this.value);
}

extension LevelEnumExtension on LevelEnum {
  String get displayName {
    switch (this) {
      case LevelEnum.rookie:
        return AppLocalizations().rookie;
      case LevelEnum.beginner:
        return AppLocalizations().beginner;
      case LevelEnum.intermediate:
        return AppLocalizations().intermediate;
      case LevelEnum.advance:
        return AppLocalizations().advance;
      case LevelEnum.trueBeast:
        return AppLocalizations().trueBeast;
    }
  }
}