import 'dart:math';

class BankAccount {
    int id;
    String name;
    double balance;
    BankAccount(this.id,this.name,{this.balance=0});

  double get getBalance=>this.balance;
  void withdraw(double amount){
    if(balance<=0 || amount>balance){
      throw Exception("Cant Withdraw");
    }
    else{
      balance=balance-amount;
    }
  }
  void credit(double amount){
    balance=balance+amount;
  }

  String toString(){
    return "ID:$id , Name:$name , Balance:$balance";
  }
}

class Bank {
    // TODO
    String name;
    List<BankAccount> accounts=[];
    Bank(this.name);
    BankAccount createAccount(int accountId,String owner){
        BankAccount newAccount=BankAccount(accountId, owner);
        for(var account in accounts){
          if(account.id==newAccount.id){
            throw Exception("Account ID Already Exist");
          }
        }
        accounts.add(newAccount);
        return newAccount;
    }
    void displayAccount(){
      for(var account in accounts){
        print(account.toString());
      }
    }

}

void main() {

  Bank myBank = Bank("CADT Bank");
  BankAccount ronanAccount = myBank.createAccount(100, 'Ronan');

  print(ronanAccount.balance); // Balance: $0
  ronanAccount.credit(100);
  print(ronanAccount.balance); // Balance: $100
  ronanAccount.withdraw(50);
  print(ronanAccount.balance); // Balance: $50

  try {
    ronanAccount.withdraw(75); // This will throw an exception
  } catch (e) {
    print(e); // Output: Insufficient balance for withdrawal!
  }

  try {
    myBank.createAccount(100, 'Honlgy'); // This will throw an exception
  } catch (e) {
    print(e); // Output: Account with ID 100 already exists!
  }

    try {
    myBank.createAccount(101, 'Honlgy'); // This will throw an exception
  } catch (e) {
    print(e); // Output: Account with ID 100 already exists!
  }
  myBank.displayAccount();
}
