import 'package:flutter/material.dart';
import 'package:trading_app/model/trade_item.dart';

class OrderList extends StatelessWidget {
  OrderList({required this.list, required this.side, super.key});
  List<tradeItem> list;
  String side;
  @override
  Widget build(BuildContext context) {
    final sWidth = MediaQuery.of(context).size.width;

    Color? orderColor;
    if (side == "sell") {
      orderColor = Colors.red[500];
    } else {
      orderColor = Colors.green[500];
    }
    // TODO: implement build
    return ListView.builder(
      // reverse: true,
      itemBuilder: (ctx, index) => Container(
        height: 30,
        width: sWidth - 20,
        child: Row(crossAxisAlignment: CrossAxisAlignment.stretch,children: [
          SizedBox(width: 10,),
          SizedBox(
            width: (sWidth - 20) / 3,
            child: Text(
              list[index].amount.toString(),
              style: TextStyle(color: orderColor, fontSize: 16),
            ),
          ),
          SizedBox(
            width: (sWidth - 20) / 3,
            child: Text(
            list[index].quantity.toString(),
              style: TextStyle(color:  Colors.white, fontSize: 16),
            ),
          ),
          SizedBox(width: 30,),

          SizedBox(
            width: (sWidth - 20) / 4,
            child: Text(
              (list[index].id).toString(),
              style: TextStyle(color:  Colors.white, fontSize: 16),
            ),
          ),
        ]),
      )
      // ListTile(leading: Text(list[index].amount.toString(),style: TextStyle(color: orderColor,fontSize: 16),),title: Padding(
      //   padding: const EdgeInsets.symmetric(horizontal: 80),
      //   child: Text(list[index].quantity.toString(),style: TextStyle(color: Colors.white,fontSize: 16)),
      // ),key:ValueKey(list[index]),trailing: Text((list[index].amount*list[index].quantity).toString(),style: TextStyle(color: Colors.white,fontSize: 16),)),
      ,
      itemCount: list.length,
    );
  }
}
