import 'package:banpay/consts/consts.dart';
import 'package:banpay/provider/functions_provider.dart';
import 'package:banpay/provider/pokemon_url_list_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:banpay/provider/offset_provider.dart';
import 'package:flutter/material.dart';

class BackFowardButtonsWidget extends ConsumerWidget {
  const BackFowardButtonsWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final offset = ref.watch(offsetProvider);
    final function = ref.watch(functionsProvider);
    final pokemonUrlLis = ref.watch(pokemonUrlListProvider);
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FloatingActionButton(
          heroTag: 'forwardButton',
          tooltip: 'forwardButton',
          onPressed: () {
            switch (function) {
              case PokedexFunction.showAllPokemons:
                if (offset + delta < totalPokemons) {
                  ref.read(offsetProvider.notifier).increment();
                }
              case PokedexFunction.showPokemontype:
                if (offset + delta < pokemonUrlLis.length) {
                  ref.read(offsetProvider.notifier).increment();
                }
              case PokedexFunction.searchPokemon:
                if (offset + delta < pokemonUrlLis.length) {
                  ref.read(offsetProvider.notifier).increment();
                }
            }
          },
          backgroundColor: Colors.black87,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          child: const Icon(
            Icons.arrow_forward_ios_rounded,
            color: Colors.white,
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        FloatingActionButton(
          heroTag: 'backButton',
          tooltip: 'backButton',
          onPressed: offset == 0
              ? null
              : () {
                  ref.read(offsetProvider.notifier).decrement();
                },
          backgroundColor: Colors.black87,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          child: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
