
class Joke{
  final String title;
  final String description;
  Joke({required this.title,required this.description});
}

List<Joke> generateJokes(){
  List<Joke> jokesList = [];
  for(int i=0;i<20;i++){
    jokesList.add(Joke(title: '${i+1}', description: 'description'));
  }
  return jokesList;
}