import 'package:flutter/material.dart';

const List<String> images = [
  "assets/w4-s2/bird.jpg",
  "assets/w4-s2/bird2.jpg",
  "assets/w4-s2/insect.jpg",
  "assets/w4-s2/girl.jpg",
  "assets/w4-s2/man.jpg",
];

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false, // Why this line ? Can you explain it ?
      home: ImageViewer(),
    ));

class ImageViewer extends StatefulWidget {
  const ImageViewer({
    super.key,
  });

  @override
  State<ImageViewer> createState() => _ImageViewerState();
}

class _ImageViewerState extends State<ImageViewer> {
  int i=0;
  void goNext(){
    
    setState(() {
      //check index to be less than 5
      if(i<images.length-1){
        i++;
      }
      // if index is more then 5 reset index start again from 0 which is the bird1 pic 
      else{
        i=0;
      }
    });
  }
  void goPrevious(){
    setState(() {
      //decrement the index 
      i--;
      //check if after decrement if i<0 set the index to be the last index which is the old man pic
      if(i<0){
        i=images.length-1;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      appBar: AppBar(
        backgroundColor: Colors.green[400],
        title: const Text('Image viewer'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.navigate_before),
            tooltip: 'Go to the previous image',
            onPressed: goPrevious,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 50, 0),
            child: IconButton(
              icon: const Icon(Icons.navigate_next),
              tooltip: 'Go to the next image',
              onPressed: goNext,
            ),
          ),
        ],
      ),
      body: Image.asset(images[i]),
    );
  }
}
