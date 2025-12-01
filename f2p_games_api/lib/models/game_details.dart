import 'dart:convert';

class GameDetails {
    int id;
    String title;
    String thumbnail;
    String status;
    String shortDescription;
    String description;
    String gameUrl;
    String genre;
    String platform;
    String publisher;
    String developer;
    DateTime releaseDate;
    String freetogameProfileUrl;
    MinimumSystemRequirements minimumSystemRequirements;
    List<Screenshot> screenshots;

    GameDetails({
        required this.id,
        required this.title,
        required this.thumbnail,
        required this.status,
        required this.shortDescription,
        required this.description,
        required this.gameUrl,
        required this.genre,
        required this.platform,
        required this.publisher,
        required this.developer,
        required this.releaseDate,
        required this.freetogameProfileUrl,
        required this.minimumSystemRequirements,
        required this.screenshots,
    });

    factory GameDetails.fromJson(String str) => GameDetails.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory GameDetails.fromMap(Map<String, dynamic> json) => GameDetails(
        id: json["id"],
        title: json["title"],
        thumbnail: json["thumbnail"],
        status: json["status"],
        shortDescription: json["short_description"],
        description: json["description"],
        gameUrl: json["game_url"],
        genre: json["genre"],
        platform: json["platform"],
        publisher: json["publisher"],
        developer: json["developer"],
        releaseDate: DateTime.parse(json["release_date"]),
        freetogameProfileUrl: json["freetogame_profile_url"],
        minimumSystemRequirements: MinimumSystemRequirements.fromMap(json["minimum_system_requirements"]),
        screenshots: List<Screenshot>.from(json["screenshots"].map((x) => Screenshot.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "thumbnail": thumbnail,
        "status": status,
        "short_description": shortDescription,
        "description": description,
        "game_url": gameUrl,
        "genre": genre,
        "platform": platform,
        "publisher": publisher,
        "developer": developer,
        "release_date": "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
        "freetogame_profile_url": freetogameProfileUrl,
        "minimum_system_requirements": minimumSystemRequirements.toMap(),
        "screenshots": List<dynamic>.from(screenshots.map((x) => x.toMap())),
    };
}

class MinimumSystemRequirements {
    String os;
    String processor;
    String memory;
    String graphics;
    String storage;

    MinimumSystemRequirements({
        required this.os,
        required this.processor,
        required this.memory,
        required this.graphics,
        required this.storage,
    });

    factory MinimumSystemRequirements.fromJson(String str) => MinimumSystemRequirements.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory MinimumSystemRequirements.fromMap(Map<String, dynamic> json) => MinimumSystemRequirements(
        os: json["os"],
        processor: json["processor"],
        memory: json["memory"],
        graphics: json["graphics"],
        storage: json["storage"],
    );

    Map<String, dynamic> toMap() => {
        "os": os,
        "processor": processor,
        "memory": memory,
        "graphics": graphics,
        "storage": storage,
    };
}

class Screenshot {
    int id;
    String image;

    Screenshot({
        required this.id,
        required this.image,
    });

    factory Screenshot.fromJson(String str) => Screenshot.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Screenshot.fromMap(Map<String, dynamic> json) => Screenshot(
        id: json["id"],
        image: json["image"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "image": image,
    };
}
