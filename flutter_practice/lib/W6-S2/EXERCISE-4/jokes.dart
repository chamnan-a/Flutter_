
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
<<<<<<< HEAD
}
=======
}
>>>>>>> b9ec995cd1722c27db7ae0701ebdb4ec1b579302
