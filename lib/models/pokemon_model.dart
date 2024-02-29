class PokemonModel {
  PokemonModel({
    required this.name,
    required this.url,
  });

  String name;
  String url;

  factory PokemonModel.fromJson(Map<String, dynamic> json) => PokemonModel(
        name: json["name"],
        url: json["url"],
      );
}
