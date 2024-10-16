import 'dart:io';

class Distance{
  final double distance;
  //default
  Distance(this.distance);
  //in meter
  Distance.meter(double distance):this.distance=distance;
  //in kms
  Distance.kms(double distance):
    this.distance=distance*1000;
  //in cms
  Distance.cms(double cms):this.distance=cms/100;
  //getter 
  double get meter=> this.distance;
  double get kms=>this.distance/1000;
  double get cms=>this.distance*100;
  //operator
  Distance operator +(Distance d){
    return Distance(this.distance+d.distance);
  }

  String toString(){
    return "$distance";
  }
}
void main(){
  Distance d1=Distance.kms(3.4);
  Distance d2=Distance.meter(1000);
  print((d1+d2).kms);

}
