import 'dart:convert';

class GamesResponse {
    int id;
    String title;
    String thumbnail;
    String shortDescription;
    String gameUrl;
    Genre genre;
    Platform platform;
    String publisher;
    String developer;
    String releaseDate;
    String freetogameProfileUrl;

    GamesResponse({
        required this.id,
        required this.title,
        required this.thumbnail,
        required this.shortDescription,
        required this.gameUrl,
        required this.genre,
        required this.platform,
        required this.publisher,
        required this.developer,
        required this.releaseDate,
        required this.freetogameProfileUrl,
    });

    

    factory GamesResponse.fromJson(String str) => GamesResponse.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory GamesResponse.fromMap(Map<String, dynamic> json) => GamesResponse(
        id: json["id"],
        title: json["title"],
        thumbnail: json["thumbnail"],
        shortDescription: json["short_description"],
        gameUrl: json["game_url"],
        genre: genreValues.map[json["genre"]] ?? Genre.ACTION,
        platform: platformValues.map[json["platform"]] ?? Platform.PC_WINDOWS,
        publisher: json["publisher"],
        developer: json["developer"],
        releaseDate: json["release_date"],
        freetogameProfileUrl: json["freetogame_profile_url"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "thumbnail": thumbnail,
        "short_description": shortDescription,
        "game_url": gameUrl,
        "genre": genreValues.reverse[genre],
        "platform": platformValues.reverse[platform],
        "publisher": publisher,
        "developer": developer,
        "release_date": releaseDate,
        "freetogame_profile_url": freetogameProfileUrl,
    };
}

enum Genre {
    ACTION,
    ACTION_GAME,
    ACTION_RPG,
    ARPG,
    BATTLE_ROYALE,
    CARD_GAME,
    DUNGEON_CRAWLER,
    FANTASY,
    FIGHTING,
    GENRE_MMORPG,
    MMO,
    MMOARPG,
    MMORPG,
    MOBA,
    RACING,
    RPG,
    SHOOTER,
    SOCIAL,
    SPORTS,
    STRATEGY
}

final genreValues = EnumValues({
    "Action": Genre.ACTION,
    "Action Game": Genre.ACTION_GAME,
    "Action RPG": Genre.ACTION_RPG,
    "ARPG": Genre.ARPG,
    "Battle Royale": Genre.BATTLE_ROYALE,
    "Card Game": Genre.CARD_GAME,
    "Dungeon Crawler": Genre.DUNGEON_CRAWLER,
    "Fantasy": Genre.FANTASY,
    "Fighting": Genre.FIGHTING,
    " MMORPG": Genre.GENRE_MMORPG,
    "MMO": Genre.MMO,
    "MMOARPG": Genre.MMOARPG,
    "MMORPG": Genre.MMORPG,
    "MOBA": Genre.MOBA,
    "Racing": Genre.RACING,
    "RPG": Genre.RPG,
    "Shooter": Genre.SHOOTER,
    "Social": Genre.SOCIAL,
    "Sports": Genre.SPORTS,
    "Strategy": Genre.STRATEGY
});

enum Platform {
    PC_WINDOWS,
    PC_WINDOWS_WEB_BROWSER,
    WEB_BROWSER
}

final platformValues = EnumValues({
    "PC (Windows)": Platform.PC_WINDOWS,
    "PC (Windows), Web Browser": Platform.PC_WINDOWS_WEB_BROWSER,
    "Web Browser": Platform.WEB_BROWSER
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
            reverseMap = map.map((k, v) => MapEntry(v, k));
            return reverseMap;
    }
}
