import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:okapy/screens/home/components/outgoing.dart';
import 'package:okapy/screens/payment/componets.dart';
import 'package:okapy/state/bookings.dart';
import 'package:provider/provider.dart';

class Patners extends StatefulWidget {
  const Patners({Key? key}) : super(key: key);

  @override
  State<Patners> createState() => _PatnersState();
}

class _PatnersState extends State<Patners> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Bookings>(
      builder: (context, bookingsController, child) => Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: const Text('Partners',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
            backgroundColor: Colors.white,
            elevation: 0,
            actions: [
              TextButton(
                  onPressed: () {
                    bookingsController.getpartners();
                  },
                  child: Text('partners'))
            ],
          ),
          body: bookingsController.busy == true
              ? Center(child: CircularProgressIndicator())
              : DefaultTabController(
                  length: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 50,
                        width: MediaQuery.of(context).size.width / 1.7,
                        // alignment: Alignment.bottomCenter,
                        // color: Colors.amber,
                        child: const TabBar(
                          labelColor: Color(0xff1A411D),
                          indicatorColor: Color(0xff1A411D),
                          unselectedLabelColor: Color(0xffBDBDBD),
                          // us: Color(0xffBDBDBD),

                          unselectedLabelStyle:
                              TextStyle(color: Color(0xffBDBDBD)),
                          indicatorSize: TabBarIndicatorSize.label,
                          automaticIndicatorColorAdjustment: true,

                          tabs: [
                            Tab(
                              child: Text(
                                'Partners list',
                                style: TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Tab(
                              child: Text(
                                'Orders',
                                style: TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Divider(
                        height: 2,
                      ),
                      SizedBox(
                        height:
                            ((MediaQuery.of(context).size.height / 1.2) - 50),
                        child: TabBarView(
                          children: [
                            partnersList(context, bookingsController),
                            partnersOrders(context)
                          ],
                        ),
                      ),
                    ],
                  ),
                )),
    );
  }
}
