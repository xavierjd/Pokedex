// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:banpay/provider/pokemon_type_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:banpay/mock_data/mock_data.dart';
import 'package:banpay/provider/search_pokemon_provider.dart';
import 'package:banpay/provider/functions_provider.dart';
import 'package:banpay/screens/details_screen.dart';
import 'package:banpay/screens/home_screen.dart';
import 'package:banpay/widgets/card_widget.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';

void main() {
  testWidgets('RETURNED_POKEMON_DETAILS_FROM_CARD_WIDGET_TEST',
      (WidgetTester tester) async {
    await mockNetworkImages(
      () async => tester.pumpWidget(
        //Mock data
        MaterialApp(
          home: CardWidget(
            item: mockBulbasaurPokemonDetails,
          ),
        ),
      ),
    );
    // Expect to display
    expect(find.text('Bulbasaur'), findsOneWidget);
    expect(find.text('#1'), findsOneWidget);
    expect(find.text('Grass'), findsOneWidget);
    expect(find.text('Poison'), findsOneWidget);
  });

  testWidgets('RETURNED_POKEMON_DETAILS_SCREEN_FROM_DETAILS_SCREEN_TEST',
      (WidgetTester tester) async {
    await mockNetworkImages(
      () async => tester.pumpWidget(
        // Mock data with Providers
        MaterialApp(
          home: DetailsScreen(
            data: mockCharmeleonPokemonDetails,
          ),
        ),
      ),
    );
    // Expect to display
    expect(find.text('ID'), findsOneWidget);
    expect(find.text('#5'), findsOneWidget);
    expect(find.text('Name'), findsWidgets);
    expect(find.text('Charmeleon'), findsWidgets);
    expect(find.text('Types'), findsOneWidget);
    expect(find.text('Fire'), findsWidgets);
    expect(find.text('Height (m)'), findsOneWidget);
    expect(find.text('1.1'), findsWidgets);
    expect(find.text('Weight (kg)'), findsOneWidget);
    expect(find.text('19.0'), findsWidgets);
    expect(find.text('Abilities'), findsOneWidget);
    expect(find.text('Blaze,Solar-power'), findsWidgets);
  });

  testWidgets('RETURNED_ALL_POKEMONS_IN_HOME_SCREEN_TEST',
      (WidgetTester tester) async {
    await mockNetworkImages(() => tester.pumpWidget(
          // Mock data with Providers
          ProviderScope(
            overrides: [
              selectedFunctionProvider.overrideWith(
                (ref) => mockAllPokemonsList,
              ),
            ],
            child: MaterialApp(
              theme: ThemeData(fontFamily: 'Rubik'),
              debugShowCheckedModeBanner: false,
              home: const HomeScreen(),
            ),
          ),
        ));
    // Expect to display
    expect(find.text('Bulbasaur'), findsOneWidget);
    expect(find.text('#1'), findsOneWidget);
    expect(find.text('Grass'), findsWidgets);

    expect(find.text('Ivysaur'), findsOneWidget);
    expect(find.text('#2'), findsOneWidget);
    expect(find.text('Poison'), findsWidgets);

    expect(find.text('Venusaur'), findsOneWidget);
    expect(find.text('#3'), findsOneWidget);

    expect(find.text('Charmander'), findsOneWidget);
    expect(find.text('#4'), findsOneWidget);
    expect(find.text('Fire'), findsWidgets);

    // Realiza un desplazamiento hacia abajo en el GridView
    await tester.drag(find.byType(GridView), const Offset(0.0, -500.0));
    await tester.pump();

    expect(find.text('Charmeleon'), findsOneWidget);
    expect(find.text('#5'), findsOneWidget);
    expect(find.text('Charizard'), findsOneWidget);
    expect(find.text('#6'), findsOneWidget);
    expect(find.text('Flying'), findsWidgets);
  });

  testWidgets('RETURNED_POKEMON_SEARCHED_FROM_POKEMON_SEARCH_TEST',
      (WidgetTester tester) async {
    await mockNetworkImages(() => tester.pumpWidget(
          // Mock data with Providers
          ProviderScope(
            overrides: [
              selectedFunctionProvider.overrideWith(
                (ref) => mockSearchedPokemonsList,
              ),
              functionsProvider.overrideWith(
                (ref) =>
                    SelectFunction()..state = PokedexFunction.searchPokemon,
              ),
              searchPokemonProvider.overrideWith(
                (ref) => SearchQuery()..state = 'char',
              ),
            ],
            child: MaterialApp(
              theme: ThemeData(fontFamily: 'Rubik'),
              debugShowCheckedModeBanner: false,
              home: const HomeScreen(),
            ),
          ),
        ));
    // Expect to display
    expect(find.text('Charmander'), findsOneWidget);
    expect(find.text('Charmeleon'), findsOneWidget);
    expect(find.text('Charizard'), findsOneWidget);
  });
  testWidgets('RETURNED_POKEMON_TYPE_FROM_POKEMON_MENU_TEST',
      (WidgetTester tester) async {
    await mockNetworkImages(() => tester.pumpWidget(
          // Mock data with Providers
          ProviderScope(
            overrides: [
              selectedFunctionProvider.overrideWith(
                (ref) => mockPokemonsTypeList,
              ),
              pokemonTypeProvider.overrideWith(
                (ref) => PokemonType()..state = 1,
              ),
              functionsProvider.overrideWith(
                (ref) =>
                    SelectFunction()..state = PokedexFunction.showPokemontype,
              ),
            ],
            child: MaterialApp(
              theme: ThemeData(fontFamily: 'Rubik'),
              debugShowCheckedModeBanner: false,
              home: const HomeScreen(),
            ),
          ),
        ));
    // Expect to display
    expect(find.byTooltip('All'), findsOneWidget);
    expect(find.byTooltip('Normal'), findsOneWidget);

    expect(find.text('Pidgey'), findsOneWidget);
    expect(find.text('Pidgeotto'), findsOneWidget);
    expect(find.text('Pidgeot'), findsOneWidget);
    expect(find.text('Rattata'), findsOneWidget);
  });
}
