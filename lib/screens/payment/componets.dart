import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:okapy/screens/utils/colors.dart';
import 'package:okapy/state/bookings.dart';

Widget partnersList(BuildContext context, Bookings bookingsController) {
  return Column(
    children: [
      const Divider(
        height: 2,
      ),
      Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10, top: 10),
        child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * .65,
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10),
              child: SizedBox(
                width: 326,
                height: 45,
                child: TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                      color: themeColorGreen,
                    ),
                    // border: InputBorder()
                    hintText: 'Search',
                  ),
                ),
              ),
            ),
          ),
        ]),
      ),
      Expanded(
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10, top: 10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: themeColorAmber),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                            height: 20,
                            width: 60,
                            child: Center(
                              child: Text(
                                'Fashion',
                                style: TextStyle(
                                    color: themeColorGreen, fontSize: 10),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: themeColorAmber),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                            height: 20,
                            width: 60,
                            child: Center(
                              child: Text(
                                'Bakery',
                                style: TextStyle(
                                    color: themeColorGreen, fontSize: 10),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: themeColorAmber),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                            height: 20,
                            width: 60,
                            child: Center(
                              child: Text(
                                'Pharmacy',
                                style: TextStyle(
                                    color: themeColorGreen, fontSize: 10),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: themeColorAmber),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                            height: 20,
                            width: 110,
                            child: Center(
                              child: Text(
                                'Supermarket',
                                style: TextStyle(
                                    color: themeColorGreen, fontSize: 10),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: themeColorAmber),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(5))),
                            height: 20,
                            width: 110,
                            child: Center(
                              child: Text(
                                'Manufacturing',
                                style: TextStyle(
                                    color: themeColorGreen, fontSize: 10),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: themeColorAmber),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(5))),
                            height: 20,
                            width: 60,
                            child: Center(
                              child: Text(
                                'Food',
                                style: TextStyle(
                                    color: themeColorGreen, fontSize: 10),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: const [
                    Text('Partners',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600)),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  // scrollDirection: Axis.horizontal,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ...bookingsController.partners
                        .map(
                          (e) => SizedBox(
                            width: MediaQuery.of(context).size.width * .28,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                //Todo Network Image does not work//
                                Image.asset(
                                  'assets/image.png',
                                  height: 95,
                                  width: 122,
                                ),
                                const SizedBox(
                                  height: 2,
                                ),
                                Text(
                                  '${e.name}',
                                  style: TextStyle(
                                      fontSize: 9, fontWeight: FontWeight.w600),
                                ),
                                const SizedBox(
                                  height: 2,
                                ),
                                Text(
                                  "${e.owner?.email}",
                                  style: TextStyle(
                                      color: themeColorGrey, fontSize: 12),
                                  textAlign: TextAlign.start,
                                ),
                              ],
                            ),
                          ),
                        )
                        .toList()
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    ],
  );
}

Widget partnersOrders(BuildContext context) {
  return Column(
    children: [
      const Divider(
        height: 2,
      ),
      Padding(
        padding: const EdgeInsets.only(left: 10.0, right: 10, top: 10),
        child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * .65,
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10),
              child: SizedBox(
                width: 326,
                height: 45,
                child: TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                      color: themeColorGreen,
                    ),
                    // border: InputBorder()
                    hintText: 'Search',
                  ),
                ),
              ),
            ),
          ),
        ]),
      ),
      Expanded(
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10, top: 10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: const [
                    Text('Today',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600)),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                ListTile(
                  contentPadding: const EdgeInsets.all(0),
                  leading: Image.asset(
                    'assets/image.png',
                    height: 95,
                    width: 122,
                  ),
                  title: Text(
                    'Jack and Jill restaurant',
                    style: TextStyle(color: themeColorGreen, fontSize: 12),
                  ),
                  subtitle: const Text(
                    'Order : 6435839',
                    style: TextStyle(fontSize: 8),
                  ),
                  trailing: Text(
                    'Ksh.350',
                    style: TextStyle(color: themeColorGreen, fontSize: 14),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ],
  );
}
