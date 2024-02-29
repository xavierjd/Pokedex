import 'package:flutter/material.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';

import 'package:banpay/consts/consts.dart';
import 'package:banpay/models/pokemon_details_model.dart';
import 'package:banpay/screens/details_screen.dart';
import 'package:banpay/utils/utils.dart';
import 'package:banpay/widgets/text_widget.dart';

class CardWidget extends StatefulWidget {
  const CardWidget({super.key, required this.item});

  final PokemonDetailsModel item;

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils(context).getScreenSize;
    final path = Uri.parse(widget.item.types.first.type.url);
    final typeNum = path.pathSegments[3];

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsScreen(
              data: widget.item,
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
        child: Container(
          decoration: BoxDecoration(
            color: pokemonTypes[int.parse(typeNum)]['color'],
            borderRadius: const BorderRadius.all(Radius.circular(15)),
          ),
          child: Stack(
            alignment: Alignment.bottomRight,
            children: [
              Image.asset(
                'assets/images/pokeball.png',
                height: screenSize.width * 0.15,
                fit: BoxFit.fitHeight,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextWidget(
                          text: '#${widget.item.id}',
                          color: Colors.white,
                          textSize: 15,
                          maxLines: 2,
                          isTitle: true,
                        ),
                        widget.item.sprites.other!.officialArtwork
                                        .frontDefault ==
                                    null ||
                                widget.item.sprites.other!.officialArtwork
                                        .frontShiny ==
                                    null
                            ? Image.asset(
                                'assets/images/pokeball.png',
                                width: screenSize.width * 0.22,
                                height: screenSize.width * 0.22,
                                fit: BoxFit.fill,
                              )
                            : FancyShimmerImage(
                                imageUrl: widget.item.sprites.other!
                                            .officialArtwork.frontDefault ==
                                        null
                                    ? widget.item.sprites.other!.officialArtwork
                                        .frontShiny!
                                    : widget.item.sprites.other!.officialArtwork
                                        .frontDefault!,
                                height: screenSize.width * 0.22,
                                width: screenSize.width * 0.22,
                                boxFit: BoxFit.fill,
                              ),
                      ],
                    ),
                    Stack(
                      alignment: Alignment.topLeft,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextWidget(
                              text: widget.item.name.toCapitalized(),
                              color: Colors.white,
                              textSize: 15,
                              maxLines: 1,
                              isTitle: true,
                            ),
                            Row(
                              children: widget.item.types
                                  .map(
                                    (i) => Row(
                                      children: [
                                        Container(
                                          decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(10),
                                            ),
                                            color: Colors.black26,
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                              left: 8.0,
                                              right: 8.0,
                                              top: 4.0,
                                              bottom: 4.0,
                                            ),
                                            child: TextWidget(
                                              text: i.type.name
                                                  .toString()
                                                  .toCapitalized(),
                                              color: Colors.white,
                                              textSize: 10,
                                              isTitle: true,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 8,
                                        ),
                                      ],
                                    ),
                                  )
                                  .toList(),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
