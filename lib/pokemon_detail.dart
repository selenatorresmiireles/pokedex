import 'package:flutter/material.dart';
import 'package:pokedex/pokedex.dart';

class PokemonDetail extends StatelessWidget {
  final Pokemon pokemon;

  PokemonDetail({this.pokemon});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.cyan,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.lightBlue,
          title: Text(pokemon.name),
        ),
        body: Stack(
          children: <Widget>[
            Positioned(
                height: MediaQuery
                    .of(context)
                    .size
                    .height / 1.5,
                width: MediaQuery
                    .of(context)
                    .size
                    .width - 20,
                left: 10,
                top: MediaQuery.of(context).size.height * 0.1,
                child: Card(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      SizedBox(
                        height: 70.0,
                      ),
                      Text(pokemon.name, style: TextStyle(
                          fontSize: 25, fontWeight: FontWeight.bold),),
                      Text("Height: ${pokemon.height}"),
                      Text("Weigth: ${pokemon.weight}"),
                      Text("Types",
                        style: TextStyle(fontWeight: FontWeight.bold),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: pokemon.type.map((t) =>
                            FilterChip(
                              backgroundColor: Colors.cyan,
                              label: Text(t, style: TextStyle(
                                  color: Colors.white),),
                              onSelected: (b) {},
                            )).toList(),
                      ),
                      Text("Weakness", style: TextStyle(fontWeight: FontWeight.bold),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: pokemon.weaknesses.map((t) =>
                            FilterChip(
                              backgroundColor: Colors.cyanAccent,
                              label: Text(t, style: TextStyle(
                                  color: Colors.white),),
                              onSelected: (b) {},
                            )).toList(),
                      ),
                      Text("Next Evolution", style: TextStyle(fontWeight: FontWeight.bold),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: pokemon.nextEvolution == null ? <Widget>[Text("final form!")] : pokemon.nextEvolution.map((t) =>
                            FilterChip(
                              backgroundColor: Colors.cyanAccent,
                              label: Text(t.name, style: TextStyle(
                                  color: Colors.blueAccent),),
                              onSelected: (b) {},
                            )).toList(),
                      )

                    ],
                  ),
                )
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Hero(
                tag: pokemon.img,
                child: Container(
                  height: 150.0,
                  width: 150.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(pokemon.img)
                    )
                  )
                )
              ),
            )
          ],
        )
    );
  }
}
