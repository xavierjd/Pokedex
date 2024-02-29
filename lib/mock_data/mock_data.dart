import 'package:banpay/models/pokemon_details_model.dart';

PokemonDetailsModel mockBulbasaurPokemonDetails = PokemonDetailsModel(
  id: 1,
  name: 'bulbasaur',
  types: [
    Type(
      type: Name(
        name: 'grass',
        url: 'https://pokeapi.co/api/v2/type/12/',
      ),
    ),
    Type(
      type: Name(
        name: 'poison',
        url: 'https://pokeapi.co/api/v2/type/4/',
      ),
    ),
  ],
  height: 7,
  weight: 69,
  abilities: [
    Ability(
      ability: Name(
        name: 'overgrow',
        url: 'https://pokeapi.co/api/v2/ability/65/',
      ),
    ),
    Ability(
      ability: Name(
          name: 'chlorophyll', url: 'https://pokeapi.co/api/v2/ability/34/'),
    ),
  ],
  sprites: Sprites(
    other: Other(
      officialArtwork: OfficialArtwork(
        frontDefault:
            'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1.png',
        frontShiny:
            'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/shiny/1.png',
      ),
    ),
  ),
);

PokemonDetailsModel mockCharmeleonPokemonDetails = PokemonDetailsModel(
  id: 5,
  name: 'charmeleon',
  types: [
    Type(
      type: Name(
        name: 'fire',
        url: 'https://pokeapi.co/api/v2/type/10/',
      ),
    ),
  ],
  height: 11,
  weight: 190,
  abilities: [
    Ability(
      ability:
          Name(name: 'blaze', url: 'https://pokeapi.co/api/v2/ability/66/'),
    ),
    Ability(
      ability: Name(
          name: 'solar-power', url: 'https://pokeapi.co/api/v2/ability/94/'),
    ),
  ],
  sprites: Sprites(
    other: Other(
      officialArtwork: OfficialArtwork(
        frontDefault:
            'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/5.png',
        frontShiny:
            'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/5.png',
      ),
    ),
  ),
);

List<PokemonDetailsModel> mockAllPokemonsList = [
  PokemonDetailsModel(
    id: 1,
    name: 'bulbasaur',
    types: [
      Type(
        type: Name(
          name: 'grass',
          url: 'https://pokeapi.co/api/v2/type/12/',
        ),
      ),
      Type(
        type: Name(
          name: 'poison',
          url: 'https://pokeapi.co/api/v2/type/4/',
        ),
      ),
    ],
    height: 7,
    weight: 69,
    abilities: [
      Ability(
        ability: Name(
            name: 'overgrow', url: 'https://pokeapi.co/api/v2/ability/65/'),
      ),
      Ability(
        ability: Name(
            name: 'chlorophyll', url: 'https://pokeapi.co/api/v2/ability/34/'),
      ),
    ],
    sprites: Sprites(
      other: Other(
        officialArtwork: OfficialArtwork(
          frontDefault:
              'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1.png',
          frontShiny:
              'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/shiny/1.png',
        ),
      ),
    ),
  ),
  PokemonDetailsModel(
    id: 2,
    name: 'ivysaur',
    types: [
      Type(
        type: Name(
          name: 'grass',
          url: 'https://pokeapi.co/api/v2/type/12/',
        ),
      ),
      Type(
        type: Name(
          name: 'poison',
          url: 'https://pokeapi.co/api/v2/type/4/',
        ),
      ),
    ],
    height: 10,
    weight: 130,
    abilities: [
      Ability(
        ability: Name(
          name: 'overgrow',
          url: 'https://pokeapi.co/api/v2/ability/65/',
        ),
      ),
      Ability(
        ability: Name(
          name: 'chlorophyll',
          url: 'https://pokeapi.co/api/v2/ability/34/',
        ),
      ),
    ],
    sprites: Sprites(
      other: Other(
        officialArtwork: OfficialArtwork(
          frontDefault:
              'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/2.png',
          frontShiny:
              'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/shiny/2.png',
        ),
      ),
    ),
  ),
  PokemonDetailsModel(
    id: 3,
    name: 'venusaur',
    types: [
      Type(
        type: Name(
          name: 'grass',
          url: 'https://pokeapi.co/api/v2/type/12/',
        ),
      ),
      Type(
        type: Name(name: 'poison', url: 'https://pokeapi.co/api/v2/type/4/'),
      ),
    ],
    height: 20,
    weight: 1000,
    abilities: [
      Ability(
        ability: Name(
          name: 'overgrow',
          url: 'https://pokeapi.co/api/v2/ability/65/',
        ),
      ),
      Ability(
        ability: Name(
          name: 'chlorophyll',
          url: 'https://pokeapi.co/api/v2/ability/34/',
        ),
      ),
    ],
    sprites: Sprites(
      other: Other(
        officialArtwork: OfficialArtwork(
          frontDefault:
              'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/3.png',
          frontShiny:
              'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/shiny/3.png',
        ),
      ),
    ),
  ),
  PokemonDetailsModel(
    id: 4,
    name: 'charmander',
    types: [
      Type(
        type: Name(
          name: 'fire',
          url: 'https://pokeapi.co/api/v2/type/10/',
        ),
      ),
    ],
    height: 6,
    weight: 85,
    abilities: [
      Ability(
        ability:
            Name(name: 'blaze', url: 'https://pokeapi.co/api/v2/ability/66/'),
      ),
      Ability(
        ability: Name(
            name: 'solar-power', url: 'https://pokeapi.co/api/v2/ability/94/'),
      ),
    ],
    sprites: Sprites(
      other: Other(
        officialArtwork: OfficialArtwork(
          frontDefault:
              'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/4.png',
          frontShiny:
              'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/shiny/4.png',
        ),
      ),
    ),
  ),
  PokemonDetailsModel(
    id: 5,
    name: 'charmeleon',
    types: [
      Type(
        type: Name(
          name: 'fire',
          url: 'https://pokeapi.co/api/v2/type/10/',
        ),
      ),
    ],
    height: 11,
    weight: 190,
    abilities: [
      Ability(
        ability:
            Name(name: 'blaze', url: 'https://pokeapi.co/api/v2/ability/66/'),
      ),
      Ability(
        ability: Name(
            name: 'solar-power', url: 'https://pokeapi.co/api/v2/ability/94/'),
      ),
    ],
    sprites: Sprites(
      other: Other(
        officialArtwork: OfficialArtwork(
          frontDefault:
              'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/5.png',
          frontShiny:
              'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/5.png',
        ),
      ),
    ),
  ),
  PokemonDetailsModel(
    id: 6,
    name: 'charizard',
    types: [
      Type(
        type: Name(
          name: 'fire',
          url: 'https://pokeapi.co/api/v2/type/10/',
        ),
      ),
    ],
    height: 17,
    weight: 905,
    abilities: [
      Ability(
        ability:
            Name(name: 'blaze', url: 'https://pokeapi.co/api/v2/ability/66/'),
      ),
      Ability(
        ability: Name(
            name: 'solar-power', url: 'https://pokeapi.co/api/v2/ability/94/'),
      ),
    ],
    sprites: Sprites(
      other: Other(
        officialArtwork: OfficialArtwork(
          frontDefault:
              'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/6.png',
          frontShiny:
              'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/shiny/6.png',
        ),
      ),
    ),
  ),
];

List<PokemonDetailsModel> mockSearchedPokemonsList = [
  PokemonDetailsModel(
    id: 4,
    name: 'charmander',
    types: [
      Type(
        type: Name(
          name: 'fire',
          url: 'https://pokeapi.co/api/v2/type/10/',
        ),
      ),
    ],
    height: 6,
    weight: 85,
    abilities: [
      Ability(
        ability:
            Name(name: 'blaze', url: 'https://pokeapi.co/api/v2/ability/66/'),
      ),
      Ability(
        ability: Name(
            name: 'solar-power', url: 'https://pokeapi.co/api/v2/ability/94/'),
      ),
    ],
    sprites: Sprites(
      other: Other(
        officialArtwork: OfficialArtwork(
          frontDefault:
              'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/4.png',
          frontShiny:
              'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/shiny/4.png',
        ),
      ),
    ),
  ),
  PokemonDetailsModel(
    id: 5,
    name: 'charmeleon',
    types: [
      Type(
        type: Name(
          name: 'fire',
          url: 'https://pokeapi.co/api/v2/type/10/',
        ),
      ),
    ],
    height: 11,
    weight: 190,
    abilities: [
      Ability(
        ability:
            Name(name: 'blaze', url: 'https://pokeapi.co/api/v2/ability/66/'),
      ),
      Ability(
        ability: Name(
            name: 'solar-power', url: 'https://pokeapi.co/api/v2/ability/94/'),
      ),
    ],
    sprites: Sprites(
      other: Other(
        officialArtwork: OfficialArtwork(
          frontDefault:
              'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/5.png',
          frontShiny:
              'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/5.png',
        ),
      ),
    ),
  ),
  PokemonDetailsModel(
    id: 6,
    name: 'charizard',
    types: [
      Type(
        type: Name(
          name: 'fire',
          url: 'https://pokeapi.co/api/v2/type/10/',
        ),
      ),
    ],
    height: 17,
    weight: 905,
    abilities: [
      Ability(
        ability:
            Name(name: 'blaze', url: 'https://pokeapi.co/api/v2/ability/66/'),
      ),
      Ability(
        ability: Name(
            name: 'solar-power', url: 'https://pokeapi.co/api/v2/ability/94/'),
      ),
    ],
    sprites: Sprites(
      other: Other(
        officialArtwork: OfficialArtwork(
          frontDefault:
              'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/6.png',
          frontShiny:
              'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/shiny/6.png',
        ),
      ),
    ),
  ),
];

List<PokemonDetailsModel> mockPokemonsTypeList = [
  PokemonDetailsModel(
    id: 16,
    name: 'pidgey',
    types: [
      Type(
        type: Name(
          name: 'fire',
          url: 'https://pokeapi.co/api/v2/type/10/',
        ),
      ),
    ],
    height: 6,
    weight: 85,
    abilities: [
      Ability(
        ability:
            Name(name: 'blaze', url: 'https://pokeapi.co/api/v2/ability/66/'),
      ),
      Ability(
        ability: Name(
            name: 'solar-power', url: 'https://pokeapi.co/api/v2/ability/94/'),
      ),
    ],
    sprites: Sprites(
      other: Other(
        officialArtwork: OfficialArtwork(
          frontDefault:
              'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/4.png',
          frontShiny:
              'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/shiny/4.png',
        ),
      ),
    ),
  ),
  PokemonDetailsModel(
    id: 17,
    name: 'pidgeotto',
    types: [
      Type(
        type: Name(
          name: 'fire',
          url: 'https://pokeapi.co/api/v2/type/10/',
        ),
      ),
    ],
    height: 6,
    weight: 85,
    abilities: [
      Ability(
        ability:
            Name(name: 'blaze', url: 'https://pokeapi.co/api/v2/ability/66/'),
      ),
      Ability(
        ability: Name(
            name: 'solar-power', url: 'https://pokeapi.co/api/v2/ability/94/'),
      ),
    ],
    sprites: Sprites(
      other: Other(
        officialArtwork: OfficialArtwork(
          frontDefault:
              'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/4.png',
          frontShiny:
              'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/shiny/4.png',
        ),
      ),
    ),
  ),
  PokemonDetailsModel(
    id: 18,
    name: 'pidgeot',
    types: [
      Type(
        type: Name(
          name: 'fire',
          url: 'https://pokeapi.co/api/v2/type/10/',
        ),
      ),
    ],
    height: 6,
    weight: 85,
    abilities: [
      Ability(
        ability:
            Name(name: 'blaze', url: 'https://pokeapi.co/api/v2/ability/66/'),
      ),
      Ability(
        ability: Name(
            name: 'solar-power', url: 'https://pokeapi.co/api/v2/ability/94/'),
      ),
    ],
    sprites: Sprites(
      other: Other(
        officialArtwork: OfficialArtwork(
          frontDefault:
              'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/4.png',
          frontShiny:
              'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/shiny/4.png',
        ),
      ),
    ),
  ),
  PokemonDetailsModel(
    id: 19,
    name: 'rattata',
    types: [
      Type(
        type: Name(
          name: 'fire',
          url: 'https://pokeapi.co/api/v2/type/10/',
        ),
      ),
    ],
    height: 6,
    weight: 85,
    abilities: [
      Ability(
        ability: Name(
          name: 'blaze',
          url: 'https://pokeapi.co/api/v2/ability/66/',
        ),
      ),
      Ability(
        ability: Name(
          name: 'solar-power',
          url: 'https://pokeapi.co/api/v2/ability/94/',
        ),
      ),
    ],
    sprites: Sprites(
      other: Other(
        officialArtwork: OfficialArtwork(
          frontDefault:
              'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/4.png',
          frontShiny:
              'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/shiny/4.png',
        ),
      ),
    ),
  ),
];
