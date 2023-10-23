class balance{
  balance({required this.USD,required this.Google});
  double USD;
  double Google;
}

class Users{
Users(this.id,this.balances);
int id;
balance balances;
}

List<Users>user=[
  Users(0, balance(USD: 20000,Google: 10)),
  Users(1, balance(USD: 30000,Google: 20)),

];