import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text("Favorite cards"),
        ),
        body: Column(
          children: [
            FavoriteCard(title: "Card1"),
            FavoriteCard(title: "Card2")
          ],
        ),
      ),
    ));

class FavoriteCard extends StatefulWidget {
  const FavoriteCard({
    super.key,required this.title,this.description="description"
  });
  final String title;
  final String description;
  @override
  State<FavoriteCard> createState() => _FavoriteCardState();
}

class _FavoriteCardState extends State<FavoriteCard> {
  bool isFavorite=false;
  void selectButton(){
    setState(() {
      isFavorite=!isFavorite;
    });
  }
  Color get favoriteColor=> isFavorite?Colors.red:Colors.grey;
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
                  widget.title,
                  style: TextStyle(
                      color: Colors.blue, fontWeight: FontWeight.w800),
                ),
                SizedBox(height: 10.0),
                Text(widget.description)
              ],
            ),
          ),
          IconButton(
              onPressed: selectButton,
              icon:  Icon(
                Icons.favorite,               
                color: favoriteColor,
              ))
        ],
      ),
    );
  }
}
