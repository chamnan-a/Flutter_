

import 'dart:math';

enum Skill { 
  FLUTTER,
  DART,
  OTHER;
  
   }

class Employee {
  final String _name;
  double _baseSalary;
 List<Skill> _skill;
  final Address _address;
  int _expYear;

  Employee(this._name, this._baseSalary,this._skill,this._address,this._expYear);

    Employee.mobileDev(String name,double baseSalary,int expYear,Address address):
  _name=name,_baseSalary=baseSalary,_expYear=expYear,_address=address,_skill=[Skill.DART,Skill.FLUTTER];

    String get name=>_name;
  double get baseSalary=>this._baseSalary;
  Address get address=> this._address;
  int get expYear=>this._expYear;

    void printDetails() {
        double totalSalary=computeSalary(_baseSalary,_expYear,_skill);
    print('Employee: $_name, Base Salary: \$${_baseSalary} , Skill:${_skill} ,totalSalary:$totalSalary\$, expYear:$_expYear Address:$_address');
  }

  double computeSalary(double baseSalary,int expYear,List<Skill> skills){
    double totalSalary=baseSalary;
    for(int i=0;i<expYear;i++){
      totalSalary+=2000;
    }
    for(var skill in skills){
      if(skill==Skill.DART){
      totalSalary+=3000;
    }
    else if(skill==Skill.FLUTTER){
      totalSalary+=5000;
    }
    else{
      totalSalary+=1000;
    }
    }
    return totalSalary;
  }   
}




  class Address{
    String street;
    String city;
    String zipCode;
    Address(this.street,this.city,this.zipCode);
    String toString(){
      return 'Street:$street,City;$city,Zipcode:$zipCode';
    }
  }

void main() {
  var emp1 = Employee('Sokea', 40000,[Skill.OTHER,Skill.DART,Skill.FLUTTER],Address("271","Pnhom Penh","1000"),10);
  emp1.printDetails();
}