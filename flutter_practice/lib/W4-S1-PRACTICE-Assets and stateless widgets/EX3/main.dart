import 'package:flutter/material.dart';

enum ButtonType {
  Primary(Colors.blue),       
  Secondary(Colors.green),    
  Disabled(Colors.grey);      
  final Color color;
  const ButtonType(this.color);
}

 enum IconPosition {
  before(IconAlignment.start),
  after(IconAlignment.end);
  final IconAlignment iconAlignment;
  const IconPosition(this.iconAlignment);
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text("CustomButton"),
        backgroundColor: Colors.red,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Using ElevatedButton.icon with iconAlignment
            CustomButton(
              label: "Submit",
              icon: Icons.check,
              iconPosition: IconPosition.before,
              buttonType: ButtonType.Primary,
            ),
            SizedBox(height: 20,),
            CustomButton(label: "Time",
             icon: Icons.access_time,
             iconPosition: IconPosition.after,
             buttonType: ButtonType.Secondary,
             ),
             SizedBox(height: 20,),
              CustomButton(
              label: "Account",
              icon: Icons.account_tree_rounded,
              iconPosition: IconPosition.after,
              buttonType: ButtonType.Disabled,
            ),
             
          ],
        ),
      ),
    ),
  ));
}

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,required this.label,required this.icon,this.iconPosition=IconPosition.before,this.buttonType=ButtonType.Primary
  });
  final String label;
  final IconData icon;
  final IconPosition iconPosition;
  final ButtonType buttonType;
  
  @override
  Widget build(BuildContext context) {
    final isDisabled= buttonType==ButtonType.Disabled;
    return ElevatedButton.icon(
      onPressed:isDisabled?null:(){},
      icon: Icon(icon),
      label: Text(label),
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonType.color,
        padding: EdgeInsets.symmetric(vertical: 20)
      ),
      iconAlignment: iconPosition.iconAlignment, // Aligns the icon to the left
    );
  }
}
