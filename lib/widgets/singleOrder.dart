import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shopapp/models/order.dart';

class SingleOrder extends StatefulWidget {
  final Order order;
  final int index;
  SingleOrder(this.index, this.order);
  @override
  _SingleOrderState createState() => _SingleOrderState();
}

class _SingleOrderState extends State<SingleOrder> {
  bool showDetails = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("${widget.index + 1}"),
                Text(
                  DateFormat('dd/MM/yyyy').format(widget.order.datetime),
                ),
                Text("${widget.order.carts.length}"),
                IconButton(
                  icon:
                      Icon(showDetails ? Icons.expand_less : Icons.expand_more),
                  onPressed: () {
                    setState(() {
                      showDetails = !showDetails;
                    });
                  },
                ),
              ],
            ),
            if (showDetails)
              Container(
                padding: EdgeInsets.all(10),
                height: 150,
                width: double.infinity,
                color: Colors.green,
                child: SingleChildScrollView(
                  child: Column(
                    children: widget.order.carts
                        .map(
                          (item) => Padding(
                            padding: EdgeInsets.all(6),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "${item.title}",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  "\$${item.price}",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  "${item.quantity} X",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
    ;
  }
}
