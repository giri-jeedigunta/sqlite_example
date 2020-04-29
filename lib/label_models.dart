class CacheLog {
  CacheLog(this.id, this.name, this.lastUpdated);

  final int id;
  final String name, lastUpdated;

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'lastUpdated': lastUpdated,
      };
}

class AppLabelContent {
  AppLabelContent(this.id, this.name, this.description);

  final int id;
  final String name, description;

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'description': description,
      };
}

class HomeScreenCards {
  HomeScreenCards(this.id, this.name, this.description, this.fgColor,
      this.bgColor, this.image);

  final int id;
  final String name, description, fgColor, bgColor, image;

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'description': description,
        'fgColor': fgColor,
        'bgColor': bgColor,
        'image': image,
      };
}
