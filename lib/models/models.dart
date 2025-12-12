// نموذج البيانات الرئيسية للتطبيق

class GreekPlace {
  final String id;
  final String name;
  final String nameAr;
  final String description;
  final String descriptionAr;
  final String image;
  final double rating;
  final int reviews;
  final String location;
  final String category;
  final List<String> highlights;
  final String bestTime;
  final String entryFee;

  GreekPlace({
    required this.id,
    required this.name,
    required this.nameAr,
    required this.description,
    required this.descriptionAr,
    required this.image,
    required this.rating,
    required this.reviews,
    required this.location,
    required this.category,
    required this.highlights,
    required this.bestTime,
    required this.entryFee,
  });
}

class GreekMyth {
  final String id;
  final String title;
  final String titleAr;
  final String description;
  final String descriptionAr;
  final String image;
  final List<String> characters;
  final String lesson;
  final String lessonAr;

  GreekMyth({
    required this.id,
    required this.title,
    required this.titleAr,
    required this.description,
    required this.descriptionAr,
    required this.image,
    required this.characters,
    required this.lesson,
    required this.lessonAr,
  });
}

class GreekGod {
  final String id;
  final String name;
  final String nameAr;
  final String role;
  final String roleAr;
  final String description;
  final String descriptionAr;
  final String image;
  final String symbol;
  final String domain;

  GreekGod({
    required this.id,
    required this.name,
    required this.nameAr,
    required this.role,
    required this.roleAr,
    required this.description,
    required this.descriptionAr,
    required this.image,
    required this.symbol,
    required this.domain,
  });
}

class GreekFood {
  final String id;
  final String name;
  final String nameAr;
  final String description;
  final String descriptionAr;
  final String image;
  final List<String> ingredients;
  final String origin;
  final String originAr;
  final String recipe;
  final String recipeAr;

  GreekFood({
    required this.id,
    required this.name,
    required this.nameAr,
    required this.description,
    required this.descriptionAr,
    required this.image,
    required this.ingredients,
    required this.origin,
    required this.originAr,
    required this.recipe,
    required this.recipeAr,
  });
}
