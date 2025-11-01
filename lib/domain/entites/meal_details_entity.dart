class MealDetailsEntity {
  final String? idMeal;
  final String? strMeal;
  final dynamic strMealAlternate;
  final String? strCategory;
  final String? strArea;
  final String? strInstructions;
  final String? strMealThumb;
  final String? strTags;
  final String? strYoutube;
  final String? strIngredient1;
  final String? strIngredient2;
  final String? strIngredient3;
  final String? strIngredient4;
  final String? strIngredient5;
  final String? strIngredient6;
  final String? strIngredient7;
  final String? strIngredient8;
  final String? strIngredient9;
  final String? strIngredient10;
  final String? strIngredient11;
  final String? strIngredient12;
  final String? strIngredient13;
  final String? strIngredient14;
  final String? strIngredient15;
  final String? strIngredient16;
  final String? strIngredient17;
  final String? strIngredient18;
  final String? strIngredient19;
  final String? strIngredient20;
  final String? strMeasure1;
  final String? strMeasure2;
  final String? strMeasure3;
  final String? strMeasure4;
  final String? strMeasure5;
  final String? strMeasure6;
  final String? strMeasure7;
  final String? strMeasure8;
  final String? strMeasure9;
  final String? strMeasure10;
  final String? strMeasure11;
  final String? strMeasure12;
  final String? strMeasure13;
  final String? strMeasure14;
  final String? strMeasure15;
  final String? strMeasure16;
  final String? strMeasure17;
  final String? strMeasure18;
  final String? strMeasure19;
  final String? strMeasure20;
  final String? strSource;
  final dynamic strImageSource;
  final dynamic strCreativeCommonsConfirmed;
  final dynamic dateModified;

  MealDetailsEntity({
    required this.idMeal,
    required this.strMeal,
    required this.strMealAlternate,
    required this.strCategory,
    required this.strArea,
    required this.strInstructions,
    required this.strMealThumb,
    required this.strTags,
    required this.strYoutube,
    required this.strIngredient1,
    required this.strIngredient2,
    required this.strIngredient3,
    required this.strIngredient4,
    required this.strIngredient5,
    required this.strIngredient6,
    required this.strIngredient7,
    required this.strIngredient8,
    required this.strIngredient9,
    required this.strIngredient10,
    required this.strIngredient11,
    required this.strIngredient12,
    required this.strIngredient13,
    required this.strIngredient14,
    required this.strIngredient15,
    required this.strIngredient16,
    required this.strIngredient17,
    required this.strIngredient18,
    required this.strIngredient19,
    required this.strIngredient20,
    required this.strMeasure1,
    required this.strMeasure2,
    required this.strMeasure3,
    required this.strMeasure4,
    required this.strMeasure5,
    required this.strMeasure6,
    required this.strMeasure7,
    required this.strMeasure8,
    required this.strMeasure9,
    required this.strMeasure10,
    required this.strMeasure11,
    required this.strMeasure12,
    required this.strMeasure13,
    required this.strMeasure14,
    required this.strMeasure15,
    required this.strMeasure16,
    required this.strMeasure17,
    required this.strMeasure18,
    required this.strMeasure19,
    required this.strMeasure20,
    required this.strSource,
    required this.strImageSource,
    required this.strCreativeCommonsConfirmed,
    required this.dateModified,
  });

  Map<String, dynamic> toMap() {
    return {
      'idMeal': idMeal,
      'strMeal': strMeal,
      'strMealAlternate': strMealAlternate,
      'strCategory': strCategory,
      'strArea': strArea,
      'strInstructions': strInstructions,
      'strMealThumb': strMealThumb,
      'strTags': strTags,
      'strYoutube': strYoutube,
      'strIngredient1': strIngredient1,
      'strIngredient2': strIngredient2,
      'strIngredient3': strIngredient3,
      'strIngredient4': strIngredient4,
      'strIngredient5': strIngredient5,
      'strIngredient6': strIngredient6,
      'strIngredient7': strIngredient7,
      'strIngredient8': strIngredient8,
      'strIngredient9': strIngredient9,
      'strIngredient10': strIngredient10,
      'strIngredient11': strIngredient11,
      'strIngredient12': strIngredient12,
      'strIngredient13': strIngredient13,
      'strIngredient14': strIngredient14,
      'strIngredient15': strIngredient15,
      'strIngredient16': strIngredient16,
      'strIngredient17': strIngredient17,
      'strIngredient18': strIngredient18,
      'strIngredient19': strIngredient19,
      'strIngredient20': strIngredient20,
      'strMeasure1': strMeasure1,
      'strMeasure2': strMeasure2,
      'strMeasure3': strMeasure3,
      'strMeasure4': strMeasure4,
      'strMeasure5': strMeasure5,
      'strMeasure6': strMeasure6,
      'strMeasure7': strMeasure7,
      'strMeasure8': strMeasure8,
      'strMeasure9': strMeasure9,
      'strMeasure10': strMeasure10,
      'strMeasure11': strMeasure11,
      'strMeasure12': strMeasure12,
      'strMeasure13': strMeasure13,
      'strMeasure14': strMeasure14,
      'strMeasure15': strMeasure15,
      'strMeasure16': strMeasure16,
      'strMeasure17': strMeasure17,
      'strMeasure18': strMeasure18,
      'strMeasure19': strMeasure19,
      'strMeasure20': strMeasure20,
      'strSource': strSource,
      'strImageSource': strImageSource,
      'strCreativeCommonsConfirmed': strCreativeCommonsConfirmed,
      'dateModified': dateModified,
    };
  }

  factory MealDetailsEntity.fromMap(Map<String, dynamic> map) {
    return MealDetailsEntity(
      idMeal: map['idMeal'] as String,
      strMeal: map['strMeal'] as String,
      strMealAlternate: map['strMealAlternate'] as dynamic,
      strCategory: map['strCategory'] as String,
      strArea: map['strArea'] as String,
      strInstructions: map['strInstructions'] as String,
      strMealThumb: map['strMealThumb'] as String,
      strTags: map['strTags'] as String,
      strYoutube: map['strYoutube'] as String,
      strIngredient1: map['strIngredient1'] as String,
      strIngredient2: map['strIngredient2'] as String,
      strIngredient3: map['strIngredient3'] as String,
      strIngredient4: map['strIngredient4'] as String,
      strIngredient5: map['strIngredient5'] as String,
      strIngredient6: map['strIngredient6'] as String,
      strIngredient7: map['strIngredient7'] as String,
      strIngredient8: map['strIngredient8'] as String,
      strIngredient9: map['strIngredient9'] as String,
      strIngredient10: map['strIngredient10'] as String,
      strIngredient11: map['strIngredient11'] as String,
      strIngredient12: map['strIngredient12'] as String,
      strIngredient13: map['strIngredient13'] as String,
      strIngredient14: map['strIngredient14'] as String,
      strIngredient15: map['strIngredient15'] as String,
      strIngredient16: map['strIngredient16'] as String,
      strIngredient17: map['strIngredient17'] as String,
      strIngredient18: map['strIngredient18'] as String,
      strIngredient19: map['strIngredient19'] as String,
      strIngredient20: map['strIngredient20'] as String,
      strMeasure1: map['strMeasure1'] as String,
      strMeasure2: map['strMeasure2'] as String,
      strMeasure3: map['strMeasure3'] as String,
      strMeasure4: map['strMeasure4'] as String,
      strMeasure5: map['strMeasure5'] as String,
      strMeasure6: map['strMeasure6'] as String,
      strMeasure7: map['strMeasure7'] as String,
      strMeasure8: map['strMeasure8'] as String,
      strMeasure9: map['strMeasure9'] as String,
      strMeasure10: map['strMeasure10'] as String,
      strMeasure11: map['strMeasure11'] as String,
      strMeasure12: map['strMeasure12'] as String,
      strMeasure13: map['strMeasure13'] as String,
      strMeasure14: map['strMeasure14'] as String,
      strMeasure15: map['strMeasure15'] as String,
      strMeasure16: map['strMeasure16'] as String,
      strMeasure17: map['strMeasure17'] as String,
      strMeasure18: map['strMeasure18'] as String,
      strMeasure19: map['strMeasure19'] as String,
      strMeasure20: map['strMeasure20'] as String,
      strSource: map['strSource'] as String,
      strImageSource: map['strImageSource'] as dynamic,
      strCreativeCommonsConfirmed:
          map['strCreativeCommonsConfirmed'] as dynamic,
      dateModified: map['dateModified'] as dynamic,
    );
  }
}
