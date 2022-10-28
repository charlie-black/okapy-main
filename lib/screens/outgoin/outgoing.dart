import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:okapy/screens/outgoin/components/information.dart';
import 'package:okapy/screens/outgoin/components/outgoing.dart';
import 'package:okapy/state/bookings.dart';
import 'package:okapy/utils/constants.dart';
import 'package:provider/provider.dart';

class Outgoing extends StatefulWidget {
  const Outgoing({Key? key}) : super(key: key);

  @override
  State<Outgoing> createState() => _OutgoingState();
}

class _OutgoingState extends State<Outgoing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'Order Tracking',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      body: Consumer<Bookings>(
        builder: (context, bookingController, child) => DefaultTabController(
          length: 2,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 25),
                child: Container(
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      // color: Colors.black,
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          "$serverUrl${bookingController.bookingActiveModel?.product?.image}",
                        ),
                      )),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    bookingController
                                .bookingActiveModel?.product?.productType ==
                            1
                        ? Text(
                            'Electronics',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff1A411D)),
                          )
                        : bookingController
                                    .bookingActiveModel?.product?.productType ==
                                2
                            ? Text(
                                'Gift',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff1A411D)),
                              )
                            : bookingController.bookingActiveModel?.product
                                        ?.productType ==
                                    3
                                ? Text(
                                    'Document',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xff1A411D)),
                                  )
                                : bookingController.bookingActiveModel?.product
                                            ?.productType ==
                                        4
                                    ? Text(
                                        'Package',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xff1A411D)),
                                      )
                                    : Text(""),
                    Text(
                      'Ksh. 350',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff1A411D)),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 8.0, right: 8.0, top: 15),
                child: TabBar(
                  labelColor: Color(0xff1A411D),
                  indicatorColor: Color(0xff1A411D),
                  unselectedLabelColor: Color(0xffBDBDBD),
                  // us: Color(0xffBDBDBD),

                  unselectedLabelStyle: TextStyle(color: Color(0xffBDBDBD)),
                  indicatorSize: TabBarIndicatorSize.label,
                  automaticIndicatorColorAdjustment: true,
                  tabs: [
                    Tab(
                      child: Text(
                        'Timeline',
                        style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Information',
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
              Expanded(
                  child: TabBarView(children: [
                const TimelineTab(),
                InformationTab(
                    bookingActiveModel: bookingController.bookingActiveModel)
              ]))
            ],
          ),
        ),
      ),
    );
  }
}
