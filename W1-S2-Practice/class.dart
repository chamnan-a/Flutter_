class Point{
    double x,y;
  Point(this.x,this.y);

  void translation(double dx,double dy){
    var x=this.x+dx;
    var y=this.y+dy;
    print('$x,$y');
  }
}

void main(){
  Point p=Point(2,3);
  p.translation(3, 4);
}