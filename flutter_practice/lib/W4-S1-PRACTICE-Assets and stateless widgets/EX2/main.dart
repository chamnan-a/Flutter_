import 'package:flutter/material.dart';

const String dartPic = 'assets/cards/dart.png';
const String flutterPic = 'assets/cards/flutter.png';
const String firebasePic = 'assets/cards/firebase.png';
enum Product{
  dart(title: 'DART',description: "the best object languuage",image: dartPic),
  flutter(title: 'FLUTTER',description: "the best mobile widget library",image: flutterPic),
  firebase(title: 'FIREBASE',description: "the best cloud database",image: firebasePic);
  
  final String title;
  final String description;
  final String image;
    const Product({required this.title,required this.description,required this.image});
}
void main() {
runApp(MaterialApp(
  home:Scaffold(
          appBar: AppBar(
        title: Text("Products"),
        backgroundColor: Colors.grey,
      ),
    backgroundColor: Colors.blue,
    body:Padding(
      padding: EdgeInsets.all(30),
      child:Column(
        children: [
          ProductCard(product:Product.dart),
          ProductCard(product:Product.flutter),
          ProductCard(product:Product.firebase)
        ],
      )
    ) ,
  )
));

}

class ProductCard extends StatelessWidget {
  const ProductCard({required this.product,
    super.key,
  });
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Card(
       shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15), 
      ),
      child:Padding(
        padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(product.image,width: 50,height: 50,alignment: Alignment.topLeft,),
            SizedBox(height: 10),
            Text(product.title,style: TextStyle(fontSize: 40),),
            SizedBox(height: 5),
            Text(product.description,style: TextStyle(fontSize: 15),)
          ],
        ),
      )
    );
  }
}