import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

import 'package:banpay/provider/search_pokemon_provider.dart';
import 'package:banpay/provider/pokemon_type_provider.dart';
import 'package:banpay/provider/offset_provider.dart';
import 'package:banpay/provider/functions_provider.dart';
import 'package:banpay/widgets/back_forward_buttons_widget.dart';
import 'package:banpay/models/pokemon_details_model.dart';
import 'package:banpay/widgets/card_widget.dart';
import 'package:banpay/consts/consts.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends ConsumerState<HomeScreen> {
  late TextEditingController _searchQuery;

  @override
  void initState() {
    super.initState();
    _searchQuery = TextEditingController();
  }

  @override
  void dispose() {
    _searchQuery.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final selectedType = ref.watch(pokemonTypeProvider);
    final result = ref.watch(selectedFunctionProvider);
    return AbsorbPointer(
      absorbing: result.isLoading,
      child: Scaffold(
        body: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _header(),
                _searchBar(),
                const SizedBox(height: 10),
                _menu(selectedType),
                const SizedBox(height: 10),
                Expanded(
                  child: result.when(
                    data: (data) => _pokemonList(data, false),
                    error: (e, __) => Center(child: Text(e.toString())),
                    loading: () =>
                        const Center(child: CircularProgressIndicator()),
                  ),
                ),
              ],
            ),
          ],
        ),
        floatingActionButton: const BackFowardButtonsWidget(),
      ),
    );
  }

  _header() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Stack(
            alignment: Alignment.topLeft,
            children: [
              // Stroked text as border.
              Text(
                'Pokédex',
                style: TextStyle(
                  fontSize: 40,
                  fontFamily: 'Pokemon',
                  foreground: Paint()
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = 6
                    ..color = Colors.blue[700]!,
                ),
              ),
              // Solid text as fill.
              const Text(
                'Pokédex',
                style: TextStyle(
                  fontSize: 40,
                  fontFamily: 'Pokemon',
                  color: Colors.yellow,
                ),
              ),
            ],
          ),
        ),
        Image.asset(
          'assets/images/pokeball.png',
          width: 150,
          fit: BoxFit.fitWidth,
        ),
      ],
    );
  }

  Widget _searchBar() {
    return Container(
      height: 51,
      margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
      child: Row(
        children: [
          Flexible(
            child: TextField(
                controller: _searchQuery,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  hintText: 'Search Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                  fillColor: const Color(0xffe6e6ec),
                  filled: true,
                ),
                onSubmitted: (_) async {
                  //If searchbar is empty show all
                  if (_searchQuery.text.isEmpty) {
                    ref
                        .read(functionsProvider.notifier)
                        .changeFunction(PokedexFunction.showAllPokemons);
                    ref
                        .read(searchPokemonProvider.notifier)
                        .updateSearchQuery('');
                  } else {
                    ref
                        .read(functionsProvider.notifier)
                        .changeFunction(PokedexFunction.searchPokemon);
                    ref
                        .read(searchPokemonProvider.notifier)
                        .updateSearchQuery(_searchQuery.text);
                  }
                }),
          ),
          const SizedBox(
            width: 15,
          ),
        ],
      ),
    );
  }

  _menu(int selectedType) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: SegmentedButton(
        segments: [
          ButtonSegment(
            value: pokemonTypes[0]['num'],
            icon: Text(pokemonTypes[0]['type']),
            tooltip: pokemonTypes[0]['type'],
          ),
          ButtonSegment(
            value: pokemonTypes[1]['num'],
            icon: Text(pokemonTypes[1]['type']),
            tooltip: pokemonTypes[1]['type'],
          ),
          ButtonSegment(
            value: pokemonTypes[2]['num'],
            icon: Text(pokemonTypes[2]['type']),
            tooltip: pokemonTypes[2]['type'],
          ),
          ButtonSegment(
            value: pokemonTypes[3]['num'],
            icon: Text(pokemonTypes[3]['type']),
            tooltip: pokemonTypes[3]['type'],
          ),
          ButtonSegment(
            value: pokemonTypes[4]['num'],
            icon: Text(pokemonTypes[4]['type']),
            tooltip: pokemonTypes[4]['type'],
          ),
          ButtonSegment(
            value: pokemonTypes[5]['num'],
            icon: Text(pokemonTypes[5]['type']),
            tooltip: pokemonTypes[5]['type'],
          ),
          ButtonSegment(
            value: pokemonTypes[6]['num'],
            icon: Text(pokemonTypes[6]['type']),
            tooltip: pokemonTypes[6]['type'],
          ),
          ButtonSegment(
            value: pokemonTypes[7]['num'],
            icon: Text(pokemonTypes[7]['type']),
            tooltip: pokemonTypes[7]['type'],
          ),
          ButtonSegment(
            value: pokemonTypes[8]['num'],
            icon: Text(pokemonTypes[8]['type']),
            tooltip: pokemonTypes[8]['type'],
          ),
          ButtonSegment(
            value: pokemonTypes[9]['num'],
            icon: Text(pokemonTypes[9]['type']),
            tooltip: pokemonTypes[9]['type'],
          ),
          ButtonSegment(
            value: pokemonTypes[10]['num'],
            icon: Text(pokemonTypes[10]['type']),
            tooltip: pokemonTypes[10]['type'],
          ),
          ButtonSegment(
            value: pokemonTypes[11]['num'],
            icon: Text(pokemonTypes[11]['type']),
            tooltip: pokemonTypes[11]['type'],
          ),
          ButtonSegment(
            value: pokemonTypes[12]['num'],
            icon: Text(pokemonTypes[12]['type']),
            tooltip: pokemonTypes[12]['type'],
          ),
          ButtonSegment(
            value: pokemonTypes[13]['num'],
            icon: Text(pokemonTypes[13]['type']),
            tooltip: pokemonTypes[13]['type'],
          ),
          ButtonSegment(
            value: pokemonTypes[14]['num'],
            icon: Text(pokemonTypes[14]['type']),
            tooltip: pokemonTypes[14]['type'],
          ),
          ButtonSegment(
            value: pokemonTypes[15]['num'],
            icon: Text(pokemonTypes[15]['type']),
            tooltip: pokemonTypes[15]['type'],
          ),
          ButtonSegment(
            value: pokemonTypes[16]['num'],
            icon: Text(pokemonTypes[16]['type']),
            tooltip: pokemonTypes[16]['type'],
          ),
          ButtonSegment(
            value: pokemonTypes[17]['num'],
            icon: Text(pokemonTypes[17]['type']),
            tooltip: pokemonTypes[17]['type'],
          ),
          ButtonSegment(
            value: pokemonTypes[18]['num'],
            icon: Text(pokemonTypes[18]['type']),
            tooltip: pokemonTypes[18]['type'],
          ),
        ],
        selected: <int>{selectedType},
        onSelectionChanged: (selectedType) async {
          if (selectedType.first == 0) {
            // If ALL type is selected
            ref
                .read(functionsProvider.notifier)
                .changeFunction(PokedexFunction.showAllPokemons);
            ref
                .read(pokemonTypeProvider.notifier)
                .updatePokemonType(selectedType.first);
            ref.read(offsetProvider.notifier).clear();
          } else {
            // If other pokemon type is selected
            ref
                .read(functionsProvider.notifier)
                .changeFunction(PokedexFunction.showPokemontype);
            ref
                .read(pokemonTypeProvider.notifier)
                .updatePokemonType(selectedType.first);
            ref.read(offsetProvider.notifier).clear();
          }
        },
      ),
    );
  }

  Widget _pokemonList(List<PokemonDetailsModel> list, bool isLoading) {
    return Column(
      children: [
        Flexible(
          child: GridView.count(
            shrinkWrap: true,
            crossAxisCount: 2,
            childAspectRatio: 1.5,
            physics: const ClampingScrollPhysics(),
            scrollDirection: Axis.vertical,
            children: List.generate(
              list.length,
              (index) {
                return CardWidget(item: list[index]);
              },
            ),
          ),
        ),
      ],
    );
  }
}
