import 'package:flutter/material.dart';
import '../models/character.dart';

class PokemonDetailScreen extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonDetailScreen({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(pokemon.name.toUpperCase())),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: pokemon.id,
              child: Image.network(pokemon.imageUrl, height: 150),
            ),
            SizedBox(height: 16),
            Text(
              pokemon.name.toUpperCase(),
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text('Tipos: ${pokemon.types.join(', ')}'),
          ],
        ),
      ),
    );
  }
}
