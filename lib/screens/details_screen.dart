import 'package:banpay/consts/consts.dart';
import 'package:banpay/models/pokemon_details_model.dart';
import 'package:banpay/utils/utils.dart';
import 'package:banpay/widgets/loading_widget.dart';
import 'package:banpay/widgets/text_widget.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key, required this.data});

  final PokemonDetailsModel data;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  bool _isLoading = false;
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _idController;
  late TextEditingController _nameController;
  late TextEditingController _typesController;
  late TextEditingController _heightController;
  late TextEditingController _weightController;
  late TextEditingController _abilitiesController;

  @override
  void initState() {
    super.initState();
    _idController = TextEditingController(text: widget.data.id.toString());
    _nameController =
        TextEditingController(text: widget.data.name.toCapitalized());
    _typesController = TextEditingController(
        text: widget.data.types
            .map((e) => e.type.name.toCapitalized())
            .join(','));
    _heightController =
        TextEditingController(text: '${widget.data.height / 10}');
    _weightController =
        TextEditingController(text: '${widget.data.weight / 10}');

    _abilitiesController = TextEditingController(
        text: widget.data.abilities
            .map((e) => e.ability.name.toCapitalized())
            .join(','));
  }

  @override
  void dispose() {
    super.dispose();
    _idController.dispose();
    _nameController.dispose();
    _typesController.dispose();
    _heightController.dispose();
    _weightController.dispose();
    _abilitiesController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final path = Uri.parse(widget.data.types.first.type.url);
    final typeNum = path.pathSegments[3];
    return Scaffold(
      backgroundColor: pokemonTypes[int.parse(typeNum)]['color'],
      body: _buildPokemonDetails(),
    );
  }

  Widget _buildPokemonDetails() {
    Size screenSize = Utils(context).getScreenSize;
    return LoadingWidget(
      isLoading: _isLoading,
      child: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 30),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
                _pokemonDetails(screenSize),
                _pokemonForm(screenSize),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _pokemonDetails(Size screenSize) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10, bottom: 10),
          child: TextWidget(
            text: widget.data.name.toCapitalized(),
            color: Colors.white,
            textSize: 30,
            isTitle: true,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: widget.data.types
                    .map(
                      (i) => Row(
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                color: Colors.black26),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: 8.0,
                                right: 8.0,
                                top: 4.0,
                                bottom: 4.0,
                              ),
                              child: TextWidget(
                                text: i.type.name.toString().toCapitalized(),
                                color: Colors.white,
                                textSize: 18,
                                isTitle: true,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                    )
                    .toList(),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: TextWidget(
                  text: '#${widget.data.id}',
                  color: Colors.white,
                  textSize: 30,
                  isTitle: true,
                ),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                // FancyShimmerImage(
                //   imageUrl: widget.data.sprites.other!.officialArtwork
                //               .frontDefault ==
                //           null
                //       ? widget.data.sprites.other!.officialArtwork.frontShiny!
                //       : widget
                //           .data.sprites.other!.officialArtwork.frontDefault!,
                //   height: screenSize.width * 0.33,
                //   width: screenSize.width * 0.33,
                //   boxFit: BoxFit.fill,
                // )
                widget.data.sprites.other!.officialArtwork.frontDefault ==
                            null ||
                        widget.data.sprites.other!.officialArtwork.frontShiny ==
                            null
                    ? Image.asset(
                        'assets/images/pokeball.png',
                        width: screenSize.width * 0.3,
                        height: screenSize.width * 0.3,
                        fit: BoxFit.fill,
                      )
                    : FancyShimmerImage(
                        imageUrl: widget.data.sprites.other!.officialArtwork
                                    .frontDefault ==
                                null
                            ? widget
                                .data.sprites.other!.officialArtwork.frontShiny!
                            : widget.data.sprites.other!.officialArtwork
                                .frontDefault!,
                        height: screenSize.width * 0.33,
                        width: screenSize.width * 0.33,
                        boxFit: BoxFit.fill,
                      ),
              ],
            ),
            Image.asset(
              'assets/images/pokeball.png',
              height: screenSize.width * 0.3,
              width: screenSize.width * 0.3,
              fit: BoxFit.fitHeight,
            ),
          ],
        ),
      ],
    );
  }

  Widget _pokemonForm(Size screenSize) {
    return Container(
      height: screenSize.width * 1.5,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.only(left: 40),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 0, top: 8, right: 40, bottom: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: screenSize.width * 0.2,
                      child: const TextWidget(
                        text: 'ID',
                        color: Colors.blueGrey,
                        textSize: 18,
                      ),
                    ),
                    Flexible(
                      child: TextFormField(
                        controller: _idController,
                        validator: (val) {
                          if (val == null || val.isEmpty) {
                            return 'Please enter an ID';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 0, top: 8, right: 40, bottom: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: screenSize.width * 0.2,
                      child: const TextWidget(
                        text: 'Name',
                        color: Colors.blueGrey,
                        textSize: 18,
                      ),
                    ),
                    Flexible(
                      child: TextFormField(
                        controller: _nameController,
                        validator: (val) {
                          if (val == null || val.isEmpty) {
                            return 'Please enter a name';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.name,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 0, top: 8, right: 40, bottom: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: screenSize.width * 0.2,
                      child: const TextWidget(
                        text: 'Types',
                        color: Colors.blueGrey,
                        textSize: 18,
                      ),
                    ),
                    Flexible(
                      child: TextFormField(
                        controller: _typesController,
                        validator: (val) {
                          if (val == null || val.isEmpty) {
                            return 'Please enter a type';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.text,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 0, top: 8, right: 40, bottom: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: screenSize.width * 0.2,
                      child: const TextWidget(
                        text: 'Height (m)',
                        color: Colors.blueGrey,
                        textSize: 18,
                      ),
                    ),
                    Flexible(
                      child: TextFormField(
                        controller: _heightController,
                        validator: (val) {
                          if (val == null || val.isEmpty) {
                            return 'Please enter a height';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 0, top: 8, right: 40, bottom: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                        width: screenSize.width * 0.2,
                        child: const TextWidget(
                          text: 'Weight (kg)',
                          color: Colors.blueGrey,
                          textSize: 18,
                        )),
                    Flexible(
                      child: TextFormField(
                        controller: _weightController,
                        validator: (val) {
                          if (val == null || val.isEmpty) {
                            return 'Please enter a weight';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.number,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 0, top: 8, right: 40, bottom: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: screenSize.width * 0.2,
                      child: const TextWidget(
                        text: 'Abilities',
                        color: Colors.blueGrey,
                        textSize: 18,
                      ),
                    ),
                    Flexible(
                      child: TextFormField(
                        controller: _abilitiesController,
                        validator: (val) {
                          if (val == null || val.isEmpty) {
                            return 'Please enter an ability';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.text,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 0, top: 15, right: 40, bottom: 8),
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.lightBlue,
                  ),
                  onPressed: () {
                    _submitForm(context);
                  },
                  icon: const Icon(
                    Icons.sync,
                    color: Colors.white,
                  ),
                  label: const TextWidget(
                    text: 'Update',
                    color: Colors.white,
                    textSize: 18,
                    isTitle: true,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _submitForm(BuildContext context) async {
    final isValid = _formKey.currentState!.validate();
    if (isValid) {
      _formKey.currentState!.save();
      setState(() {
        _isLoading = true;
      });
      await Future.delayed(const Duration(milliseconds: 3000));
      setState(() {
        _isLoading = false;
      });
      //Function to Write to API
    }
  }
}
