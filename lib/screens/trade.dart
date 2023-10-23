import 'package:flutter/material.dart';
import 'package:trading_app/model/trade_item.dart';
import 'package:trading_app/model/users.dart';
import 'package:trading_app/screens/new_order.dart';
import 'package:trading_app/screens/profile.dart';
import 'package:trading_app/widgets/order_list.dart';

class TradeScreen extends StatefulWidget {
  @override
  State<TradeScreen> createState() {
    // TODO: implement createState
    return _TradeScreenState();
  }
}

class _TradeScreenState extends State<TradeScreen> {
  List<tradeItem> buy = [
    //  tradeItem(1, 400, 20),
    // tradeItem(1, 30, 20),
    // tradeItem(1, 10, 20),
    // tradeItem(1, 10, 10),
    // tradeItem(1, 10, 20),
    // tradeItem(1, 10, 20),
  ];
  List<tradeItem> sell = [
   
    // tradeItem(1, 20, 10),
    // tradeItem(0, 10, 20),
    // tradeItem(1, 5, 20),
    
  ];

  void flipBalance(int id1 ,int id2, double quantity,double amount){
    user[id1].balances.Google-=quantity;
    user[id2].balances.Google+=quantity;

    user[id1].balances.USD+=amount*quantity;
    user[id2].balances.USD-=amount*quantity;

  }

  double fillOrder(String side,tradeItem item){
  double remainingQuantity=item.quantity;
  if(side=="buy"){
  for (var element in sell) {
    if(element.amount>item.amount){
     continue;
    }
    if(element.quantity>item.quantity && element.id!=item.id){
      setState(() {
      element.quantity-=remainingQuantity;
      flipBalance(element.id,item.id,remainingQuantity,element.amount);
        
      });
      return 0;
    }
    else  if(item.quantity>=element.quantity && element.id != item.id){
      setState(() {
      remainingQuantity=remainingQuantity-element.quantity;
        
      flipBalance(element.id,item.id,element.quantity,element.amount);
      sell.remove(element);
      });
      return remainingQuantity;
    }
  }
  }
  else{
    for (var element in buy) {
    if(element.amount<item.amount){
     continue;
    }
    if(element.quantity>item.quantity && element.id!=item.id){
      setState(() {
      element.quantity-=remainingQuantity;
      flipBalance(item.id,element.id,remainingQuantity,item.amount);
        
      });
      return 0;
    }
    else if(item.quantity>element.quantity && element.id != item.id){
      setState(() {
      remainingQuantity=remainingQuantity-element.quantity;
      flipBalance(item.id,element.id,element.quantity,item.amount);
      buy.remove(element);
        
      });
      return remainingQuantity;
    }
  }
  }
  return remainingQuantity;
  }

  Future<void> buyScreen()async{
   tradeItem item=await Navigator.push(context, MaterialPageRoute(builder: (context) => PlaceOrder(),));
   print(item.amount);
   print(item.quantity);
   if(item==null){
    return;
   }
   final remainingQuantity=fillOrder("buy", item);

   if(remainingQuantity==0){
    return;
   }
   
   setState(() {
   buy.add(tradeItem(item.id, item.amount, remainingQuantity));
   buy.sort((a, b) => a.amount<b.amount?-1:1,);
     
   });

  }

    Future<void> sellScreen()async{
   tradeItem item=await Navigator.push(context, MaterialPageRoute(builder: (context) => PlaceOrder(),));
   print(item.amount);
   print(item.quantity);
   if(item==null){
    return;
   }
   final remainingQuantity=fillOrder("sell", item);

   if(remainingQuantity==0){
    return;
   }
   
   setState(() {
   sell.add(tradeItem(item.id, item.amount, remainingQuantity));
     sell.sort((a, b) => a.amount<b.amount?1:-1,);
   });

  }

  @override
  Widget build(BuildContext context) {
    final sHeight = MediaQuery.of(context).size.height;
    // TODO: implement build
    return Column(children: [
      const SizedBox(
        height: 20,
      ),
      Container(
        // margin: const EdgeInsets.symmetric(horizontal: 10),
        height: sHeight / 3,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.zero),
          border: Border.all(color: Colors.grey[800]!),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Amount \$',
                    style: TextStyle(color: Colors.white60, fontSize: 16),
                  ),
                  SizedBox(
                    width: 60,
                  ),
                  Text(
                    'Quantity',
                    style: TextStyle(color: Colors.white60, fontSize: 16),
                  ),
                  SizedBox(
                    width: 90,
                  ),
                  Text(
                    'User ID',
                    style: TextStyle(color: Colors.white60, fontSize: 16),
                  ),
                ],
              ),
              SizedBox(
                  height: (sHeight / 3) - 15,
                  child: OrderList(list: sell, side: "sell")),
            ],
          ),
        ),
      ),
      SizedBox(
        height: 20,
      ),
      Row(children: [
        ElevatedButton(onPressed: buyScreen, child: Text('Buy')),
        ElevatedButton(onPressed: sellScreen, child: Text('Sell')),
        ElevatedButton.icon(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen(),));
        }, label: Text('Profile'),icon: Icon(Icons.person_pin),)

      ], mainAxisAlignment: MainAxisAlignment.spaceEvenly),
      SizedBox(
        height: 20,
      ),
    Container(
        // margin: const EdgeInsets.symmetric(horizontal: 10),
        height: sHeight / 3,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.zero),
          border: Border.all(color: Colors.grey[800]!),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Amount \$',
                    style: TextStyle(color: Colors.white60, fontSize: 16),
                  ),
                  SizedBox(
                    width: 60,
                  ),
                  Text(
                    'Quantity',
                    style: TextStyle(color: Colors.white60, fontSize: 16),
                  ),
                  SizedBox(
                    width: 90,
                  ),
                  Text(
                    'User ID',
                    style: TextStyle(color: Colors.white60, fontSize: 16),
                  ),
                ],
              ),
              SizedBox(
                  height: (sHeight / 3) - 15,
                  child: OrderList(list: buy, side: "buy")),
            ],
          ),
        ),
      ),
      const SizedBox(
        height: 20,
      ),
    ]);
  }
}
