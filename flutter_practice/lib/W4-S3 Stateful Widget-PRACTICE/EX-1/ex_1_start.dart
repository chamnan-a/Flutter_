import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Custom buttons"),
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
                CustomButton(),
                SizedBox(height: 10,),
                CustomButton(),
                SizedBox(height: 10,),
                CustomButton()
            ],
          ),
        ),
      ),
    ));

class CustomButton extends StatefulWidget {
  const CustomButton({
    super.key,
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  //by default make the button as unselected
  bool isSelect=false;
  // getter 
  String get buttonText => isSelect? "Selected":"Not Selected";
  Color get textColor => isSelect? Colors.white:Colors.black;
  Color get backgroundColors => isSelect? Colors.blue[500]!:Colors.blue[50]!;

  void selectButton(){
    //make the state as the oppisite of it self so that it can be toggle false true false true...
    setState(() {
      isSelect=!isSelect;
    });
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
          width: 400,
          height: 100,
          child: ElevatedButton(
              onPressed: selectButton,
              style: ElevatedButton.styleFrom(
                backgroundColor: backgroundColors
              ),
              child: Center(
                child: Text(
                  buttonText,
                  style: TextStyle(color:textColor,fontSize: 10),
                ),
              )),
        );
  }
}
