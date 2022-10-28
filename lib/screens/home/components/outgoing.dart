import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:okapy/screens/chat/chat.dart';
import 'package:okapy/screens/createbooking/createbooking.dart';
import 'package:okapy/screens/outgoin/outgoing.dart';
import 'package:okapy/screens/utils/colors.dart';
import 'package:okapy/state/bookings.dart';
import 'package:okapy/utils/constants.dart';
import 'package:provider/provider.dart';

Consumer ongoing(BuildContext context) {
  return Consumer<Bookings>(
    builder: (context, bookingController, child) => Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 18.0),
          child: Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              // color: Colors.black,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Stack(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Outgoing()),
                    );
                  },
                  child: Padding(
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
                                "$serverUrlAssets${bookingController.bookingsDetailsModelActive!.product!.image!}"),
                          )),
                    ),
                  ),
                ),
                Positioned(
                  right: 35,
                  top: 15,
                  child: Container(
                    height: 20,
                    width: 99,
                    decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(5)),
                    child: Center(
                      child: Text(
                        '${bookingController.bookingsDetailsModelActive!.booking?.owner?.firstName}',
                        style: const TextStyle(
                            fontSize: 12,
                            color: Color(0xff1A411D),
                            fontFamily: 'Rubik',
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Chat()),
            );
          },
          child: Padding(
            padding: const EdgeInsets.only(top: 18.0),
            child: ListTile(
              leading: const CircleAvatar(
                backgroundImage: AssetImage("assets/2.png"),
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: const [
                      Text(
                        "KCB 3470K ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      Text(
                        "Muhu Njenga",
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                  Row(
                    children: const [
                      Icon(
                        Icons.star,
                        size: 18,
                        color: Color(0xffF2C110),
                      ),
                      Icon(
                        Icons.star,
                        size: 18,
                        color: Color(0xffF2C110),
                      ),
                      Icon(
                        Icons.star,
                        size: 18,
                        color: Color(0xffF2C110),
                      ),
                      Icon(
                        Icons.star,
                        size: 18,
                        color: Color(0xffF2C110),
                      ),
                      Icon(
                        Icons.star_half_rounded,
                        size: 18,
                        color: Color(0xffF2C110),
                      ),
                      Text(
                        '4.5',
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xffF2C110),
                        ),
                      )
                    ],
                  )
                ],
              ),
              trailing: Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: const Color(0xff1A411D),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      '20',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    Text(
                      'MIN',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ],
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Image.asset('assets/From.png'),
                        Padding(
                          padding: const EdgeInsets.only(right: 4.0, left: 4.0),
                          child: Text(
                            'Pickup',
                            style:
                                TextStyle(fontSize: 12, color: themeColorGrey),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            'Dubai',
                            style: TextStyle(
                                color: themeColorGreen,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    Divider(),
                    Row(
                      children: [
                        Image.asset('assets/location-icon.png'),
                        Padding(
                          padding: const EdgeInsets.only(right: 4.0, left: 4.0),
                          child: Text(
                            'Destination',
                            style:
                                TextStyle(fontSize: 12, color: themeColorGrey),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            'Turkey',
                            style: TextStyle(
                                color: themeColorGreen,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FloatingActionButton.extended(
                  elevation: 0,
                  heroTag: 'cancel',
                  backgroundColor: Colors.transparent,
                  onPressed: () {},
                  label: Row(
                    children: const [
                      Icon(
                        Icons.close_rounded,
                        size: 35,
                        color: Color(0xffBB1600),
                      ),
                      Text('Cancel')
                    ],
                  )),
              FloatingActionButton.extended(
                  elevation: 0,
                  heroTag: 'chat',
                  backgroundColor: Colors.transparent,
                  onPressed: () {},
                  label: Row(
                    children: [
                      Icon(
                        Icons.chat_outlined,
                        size: 30,
                        color: themeColorAmber,
                      ),
                      Text(
                        'Chat',
                        style: TextStyle(
                          color: themeColorGreen,
                        ),
                      )
                    ],
                  )),
              FloatingActionButton.extended(
                  elevation: 0,
                  heroTag: 'call',
                  backgroundColor: Colors.transparent,
                  onPressed: () {},
                  label: Row(
                    children: [
                      Icon(
                        Icons.phone_outlined,
                        size: 30,
                        color: themeColorAmber,
                      ),
                      Text(
                        'Call',
                        style: TextStyle(
                          color: themeColorGreen,
                        ),
                      )
                    ],
                  )),
            ],
          ),
        ),
      ],
    ),
  );
}

Column scheduled(BuildContext context) {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.only(top: 18.0),
        child: Container(
          height: 200,
          width: double.infinity,
          decoration: BoxDecoration(
            // color: Colors.black,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Stack(
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Outgoing()),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 25),
                  child: Container(
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        // color: Colors.black,
                        borderRadius: BorderRadius.circular(10),
                        image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            "assets/1.png",
                          ),
                        )),
                  ),
                ),
              ),
              Positioned(
                right: 35,
                top: 15,
                child: Container(
                  height: 20,
                  width: 99,
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(5)),
                  child: const Center(
                    child: Text(
                      'From walmart',
                      style: TextStyle(
                          fontSize: 12,
                          color: Color(0xff1A411D),
                          fontFamily: 'Rubik',
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 18.0),
        child: ListTile(
          leading: const CircleAvatar(
            backgroundImage: AssetImage("assets/2.png"),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: const [
                  Text(
                    "KCB 3470K",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Text(
                    "Muhu Njenga",
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
              Row(
                children: const [
                  Icon(
                    Icons.star,
                    size: 18,
                    color: Color(0xffF2C110),
                  ),
                  Icon(
                    Icons.star,
                    size: 18,
                    color: Color(0xffF2C110),
                  ),
                  Icon(
                    Icons.star,
                    size: 18,
                    color: Color(0xffF2C110),
                  ),
                  Icon(
                    Icons.star,
                    size: 18,
                    color: Color(0xffF2C110),
                  ),
                  Icon(
                    Icons.star_half_rounded,
                    size: 18,
                    color: Color(0xffF2C110),
                  ),
                  Text(
                    '4.5',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xffF2C110),
                    ),
                  )
                ],
              )
            ],
          ),
          trailing: Column(
            children: [
              Image.asset('assets/clock-icon.png'),
              const Padding(
                padding: EdgeInsets.only(top: 2.0),
                child: Text(
                  '12:30 PM',
                  style: TextStyle(fontSize: 11),
                ),
              ),
              const Text(
                '22/07/2022',
                style: TextStyle(fontSize: 11),
              )
            ],
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Image.asset('assets/From.png'),
                    Padding(
                      padding: const EdgeInsets.only(right: 4.0, left: 4.0),
                      child: Text(
                        'Pickup',
                        style: TextStyle(fontSize: 12, color: themeColorGrey),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        'Dubai',
                        style: TextStyle(
                            color: themeColorGreen,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                Divider(),
                Row(
                  children: [
                    Image.asset('assets/location-icon.png'),
                    Padding(
                      padding: const EdgeInsets.only(right: 4.0, left: 4.0),
                      child: Text(
                        'Destination',
                        style: TextStyle(fontSize: 12, color: themeColorGrey),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        'Turkey',
                        style: TextStyle(
                            color: themeColorGreen,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FloatingActionButton.extended(
                elevation: 0,
                heroTag: 'cancel',
                backgroundColor: Colors.transparent,
                onPressed: () {},
                label: Row(
                  children: const [
                    Icon(
                      Icons.close_rounded,
                      size: 35,
                      color: Color(0xffBB1600),
                    ),
                    Text('Cancel')
                  ],
                )),
            FloatingActionButton.extended(
                elevation: 0,
                heroTag: 'chat',
                backgroundColor: Colors.transparent,
                onPressed: () {},
                label: Row(
                  children: [
                    Icon(
                      Icons.chat_outlined,
                      size: 30,
                      color: themeColorAmber,
                    ),
                    Text(
                      'Chat',
                      style: TextStyle(
                        color: themeColorGreen,
                      ),
                    )
                  ],
                )),
            FloatingActionButton.extended(
                elevation: 0,
                heroTag: 'call',
                backgroundColor: Colors.transparent,
                onPressed: () {},
                label: Row(
                  children: [
                    Icon(
                      Icons.phone_outlined,
                      size: 30,
                      color: themeColorAmber,
                    ),
                    Text(
                      'Call',
                      style: TextStyle(
                        color: themeColorGreen,
                      ),
                    )
                  ],
                )),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 20),
        child: SizedBox(
          width: 326,
          height: 49,
          child: TextButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(themeColorAmber)),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const Createbooking()),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text(
                    'Create bookings',
                    style: TextStyle(color: Color(0xff1A411D), fontSize: 14),
                  ),
                  SizedBox(
                    width: (MediaQuery.of(context).size.width / 1.2) / 3,
                    child: const Center(
                      child: Icon(
                        Icons.keyboard_arrow_right,
                        size: 25,
                        color: Color(0xff1A411D),
                      ),
                    ),
                  )
                ],
              )),
        ),
      )
    ],
  );
}
