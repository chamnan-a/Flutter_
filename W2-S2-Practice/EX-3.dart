import 'dart:math';
class MyDuration {
  final double _ms;

  MyDuration(this._ms);
  MyDuration.fro_msecond(double sec):this._ms=sec*1000;
  MyDuration.fromMinutes(double mn):this._ms=mn*60*1000;
  MyDuration.fromHours(double hour):this._ms=hour*60*60*1000;

  bool operator >(MyDuration other){
    if(this._ms>other._ms){
      return true;
    }
    else{
      return false;
    }
  }
  MyDuration operator +(MyDuration other){
    return MyDuration(this._ms+other._ms);
  }
  MyDuration operator -(MyDuration other){
    if(this._ms<other._ms){
      throw Exception("Erro");
    }
    else return MyDuration(this._ms-other._ms);
  }

  

  // Display the duration in a readable format
  @override
  String toString() {
    int seconds = (_ms / 1000).round();
    int minutes = (seconds / 60).floor();
    seconds = seconds % 60;
    int hours = (minutes / 60).floor();
    minutes = minutes % 60;
    return '$hours hours, $minutes minutes, $seconds seconds';
  }
}




void main() {
  MyDuration duration1 = MyDuration.fromHours(3); // 3 hours
  MyDuration duration2 = MyDuration.fromMinutes(45); // 45 minutes
  print(duration1 + duration2); // 3 hours, 45 minutes, 0 seconds
  print(duration1>duration2); //true

  try {
    print(duration2 - duration1); // This will throw an exception
  } catch (e) {
    print(e); 
  }
}
