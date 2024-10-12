import 'dart:collection';

class Stack<T>{
  Queue<T> queue=Queue<T>();

  //push
  void push(T element){
    queue.addLast(element);
  }
  //pop
  void pop(){
    queue.removeLast();
  }
  //check isEmpty
  bool get isEmpty => queue.isEmpty;

  // get Last
  T get last=>queue.last;
}

  //compare
  bool compare(String top,String c){
  if ((top=='[' && c==']') || (top=='{' && c=='}') || (top=='(' && c==')'))
  {
    return true;
  }
  else{
    return false;
  }
  
  
}
void main(){
  Stack<String> stack=Stack<String>();
  String test="{what is (42)?}}";
  
      for(int i=0;i<test.length;i++){
        if(test[i]=='[' || test[i]=='{' || test[i]=='(' ){
          stack.push(test[i]);
        }
        else if(test[i]==']' || test[i]==')' || test[i]=='}'){
          if(stack.isEmpty || !compare(stack.last,test[i])){
            return;
          }
          else{
          stack.pop();
          }
        }
      }
    if (stack.isEmpty) {
    print("Balanced");
  } else {
    print("Not Balanced");
  }

}