import 'package:flutter/material.dart';
import 'jokes.dart';

Color appColor = Colors.green[300] as Color;

void main() {
  generateJokes();
  runApp(MaterialApp(
    home: Scaffold( 
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: appColor,
        title: const Text("Favorite Jokes"),
      ),
      body: const JokeList(),  // Display the JokeList widget
    ),
  ));
}

class JokeList extends StatefulWidget {
  const JokeList({super.key});

  @override
  State<JokeList> createState() => _JokeListState();
}

class _JokeListState extends State<JokeList> {
  int? currentFavoriteIndex; 



  
  void onFavoriteClick(int index) {
    setState(() {
      if (currentFavoriteIndex == index) {
        currentFavoriteIndex = -1;  
      } else {
        currentFavoriteIndex = index;  
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: jokes.map((joke) {
        int index = jokes.indexOf(joke);
        return FavoriteCard(
          joke: joke,
          isFavorite: currentFavoriteIndex == index,  
          onFavoriteClick: () => onFavoriteClick(index),
        );
      }).toList(),
    );
  }
}

class FavoriteCard extends StatelessWidget {
  final Joke joke;
  final bool isFavorite;
  final VoidCallback onFavoriteClick;

  const FavoriteCard({
    super.key,
    required this.joke,
    required this.isFavorite,
    required this.onFavoriteClick,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(width: .5, color: Colors.grey),
        ),
      ),
      padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  joke.title,
                  style: TextStyle(color: appColor, fontWeight: FontWeight.w800),
                ),
                const SizedBox(height: 10.0),
                Text(joke.description), 
              ],
            ),
          ),
          IconButton(
            onPressed: onFavoriteClick,  
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: isFavorite ? Colors.red : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
