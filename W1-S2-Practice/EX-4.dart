import 'BONUS-1.dart';

void main() {
  // Map of pizza prices
  const pizzaPrices = {
    'margherita': 5.5,
    'pepperoni': 7.5,
    'vegetarian': 6.5,
  };

  // Example order
  const orders = ['margherita', 'pepperoni','pineapple',];
  // Your code
  double sum=0;
  int i=0;
  for (var entry in pizzaPrices.entries) {
    if(i<orders.length){
      if(orders[i]==entry.key){
      sum+=entry.value;
      }
      else{
        print("${orders[i]} is not on the menu");
    }
    }
     i++;
  }
  print('total is:$sum\$');
}