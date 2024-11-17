
class Joke{
  final String title;
  final String description;
  Joke({required this.title,required this.description});
}
List<Joke> jokes=[];

void generateJokes(){
  for(int i=0;i<20;i++){
    jokes.add(Joke(title: '${i+1}', description: 'description'));
  }
}