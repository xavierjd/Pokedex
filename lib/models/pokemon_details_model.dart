class PokemonDetailsModel {
  PokemonDetailsModel({
    required this.id,
    required this.name,
    required this.types,
    required this.height,
    required this.weight,
    required this.abilities,
    required this.sprites,
  });

  List<Ability> abilities;
  int height;
  int id;
  String name;
  Sprites sprites;
  List<Type> types;
  int weight;

  factory PokemonDetailsModel.fromJson(Map<String, dynamic> json) =>
      PokemonDetailsModel(
        abilities: List<Ability>.from(
            json["abilities"].map((x) => Ability.fromJson(x))),
        height: json["height"],
        id: json["id"],
        name: json["name"],
        sprites: Sprites.fromJson(json["sprites"]),
        types: List<Type>.from(json["types"].map((x) => Type.fromJson(x))),
        weight: json["weight"],
      );

  Map<String, dynamic> toJson() => {
        "abilities": List<dynamic>.from(abilities.map((x) => x.toJson())),
        "height": height,
        "id": id,
        "name": name,
        "sprites": sprites.toJson(),
        "types": List<dynamic>.from(types.map((x) => x.toJson())),
        "weight": weight,
      };
}

class Ability {
  Ability({
    required this.ability,
  });

  Name ability;

  factory Ability.fromJson(Map<String, dynamic> json) => Ability(
        ability: Name.fromJson(json["ability"]),
      );

  Map<String, dynamic> toJson() => {
        "ability": ability.toJson(),
      };
}

class Name {
  Name({
    required this.name,
    required this.url,
  });

  String name;
  String url;

  factory Name.fromJson(Map<String, dynamic> json) => Name(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}

class Move {
  Move({
    required this.move,
  });

  Name move;

  factory Move.fromJson(Map<String, dynamic> json) => Move(
        move: Name.fromJson(json["move"]),
      );
}

class Sprites {
  Sprites({
    required this.other,
    // this.animated,
  });

  Other? other;

  factory Sprites.fromJson(Map<String, dynamic> json) => Sprites(
        other: json["other"] == null ? null : Other.fromJson(json["other"]),
      );
  Map<String, dynamic> toJson() => {
        "other": other?.toJson(),
      };
}

class OfficialArtwork {
  OfficialArtwork({
    required this.frontDefault,
    required this.frontShiny,
  });

  String? frontDefault;
  String? frontShiny;

  factory OfficialArtwork.fromJson(Map<String, dynamic> json) =>
      OfficialArtwork(
        frontDefault: json["front_default"],
        frontShiny: json["front_shiny"],
      );
  Map<String, dynamic> toJson() => {
        "front_default": frontDefault,
        "front_shiny": frontShiny,
      };
}

class Home {
  Home({
    required this.frontDefault,
    this.frontFemale,
    required this.frontShiny,
    this.frontShinyFemale,
  });

  String? frontDefault;
  dynamic frontFemale;
  String? frontShiny;
  dynamic frontShinyFemale;

  factory Home.fromJson(Map<String, dynamic> json) => Home(
        frontDefault: json["front_default"],
        frontFemale: json["front_female"],
        frontShiny: json["front_shiny"],
        frontShinyFemale: json["front_shiny_female"],
      );

  Map<String, dynamic> toJson() => {
        "front_default": frontDefault,
        "front_female": frontFemale,
        "front_shiny": frontShiny,
        "front_shiny_female": frontShinyFemale,
      };
}

class DreamWorld {
  DreamWorld({
    required this.frontDefault,
    this.frontFemale,
  });

  String? frontDefault;
  dynamic frontFemale;

  factory DreamWorld.fromJson(Map<String, dynamic> json) => DreamWorld(
        frontDefault: json["front_default"],
        frontFemale: json["front_female"],
      );

  Map<String, dynamic> toJson() => {
        "front_default": frontDefault,
        "front_female": frontFemale,
      };
}

class Other {
  Other({
    required this.officialArtwork,
  });

  OfficialArtwork officialArtwork;

  factory Other.fromJson(Map<String, dynamic> json) => Other(
        officialArtwork: OfficialArtwork.fromJson(json["official-artwork"]),
      );

  Map<String, dynamic> toJson() => {
        "official-artwork": officialArtwork.toJson(),
      };
}

class Type {
  Type({
    required this.type,
  });

  Name type;

  factory Type.fromJson(Map<String, dynamic> json) => Type(
        type: Name.fromJson(json["type"]),
      );

  Map<String, dynamic> toJson() => {
        "type": type.toJson(),
      };
}
