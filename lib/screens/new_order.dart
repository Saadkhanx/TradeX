import 'package:flutter/material.dart';
import 'package:trading_app/model/trade_item.dart';

class PlaceOrder extends StatefulWidget {
  PlaceOrder({super.key});
  // int id;

  @override
  State<PlaceOrder> createState() => _PlaceOrderState();
}

class _PlaceOrderState extends State<PlaceOrder> {
  @override
  Widget build(BuildContext context) {
    var _amountController = TextEditingController();
    var _quantityController = TextEditingController();
    var _idController = TextEditingController();

    void placeOrder() {
      final amount = double.tryParse(_amountController.text);
      final quantity = double.tryParse(_quantityController.text);
      final id=int.tryParse(_idController.text);
      if (amount == 0 || amount == null || quantity == 0 || quantity == null || id==null || id>=2) {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  content: Text(
                      "Invalid Input, Please Recheck All The Values and Try Again.",
                      style: TextStyle(color: Colors.grey[800], fontSize: 16)),
                  title: Text(
                    'Invalid Input',
                    style: TextStyle(color: Colors.grey[800], fontSize: 16),
                  ),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('Okay',
                            style: TextStyle(
                                color: Colors.grey[800], fontSize: 16)))
                  ],
                ));
      } else {
        Navigator.pop(context, tradeItem(id, amount, quantity));
      }
    }

    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Container(
        height: double.infinity,
        child: Padding(
            padding: EdgeInsets.all(80),
            child: Column(
              children: [
                Text(
                  'Google Stock',
                  style: TextStyle(color: Colors.white, fontSize: 22),
                ),
                SizedBox(
                  height: 30,
                ),
                TextField(
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  controller: _amountController,
                  decoration: InputDecoration(suffixIcon: Icon(Icons.monetization_on),
                    label:
                        Text('Amount', style: TextStyle(color: Colors.white)),
                  ),
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
                SizedBox(
                  height: 30,
                ),
                TextField(
                  keyboardType: TextInputType.numberWithOptions(decimal: true,),
                  controller: _quantityController,
                  decoration: InputDecoration(
                    label:
                        Text('Quantity', style: TextStyle(color: Colors.white)),
                  ),
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
                SizedBox(
                  height: 30,
                ),
                 TextField(maxLength: 1,
                  keyboardType: TextInputType.numberWithOptions(decimal: false),
                  controller: _idController,
                  decoration: InputDecoration(hintText: '0 or 1',hintStyle:TextStyle(color: Colors.white12),
                    label:
                        Text('User Id', style: TextStyle(color: Colors.white)),
                  ),
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
                 SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                    onPressed: placeOrder, child: Text('Place Order')),
              ],
            ),),
      ),
    );
  }
}
