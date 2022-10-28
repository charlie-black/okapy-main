import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:okapy/screens/authentication/signup.dart';
import 'package:okapy/screens/createbooking/createbooking.dart';
import 'package:okapy/screens/createbooking/getaDriver.dart';
import 'package:okapy/screens/utils/colors.dart';
import 'package:okapy/state/bookings.dart';
import 'package:okapy/utils/constants.dart';
import 'package:provider/provider.dart';

class ConfirmBooking extends StatefulWidget {
  const ConfirmBooking({Key? key}) : super(key: key);

  @override
  State<ConfirmBooking> createState() => _ConfirmBookingState();
}

class _ConfirmBookingState extends State<ConfirmBooking> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarCustom('Confirm Booking'),
      body: Consumer<Bookings>(
        builder: (context, bookingsController, child) => bookingsController.busy
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.all(15.0),
                          child: Text(
                            'Product Information',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: ListTile(
                        leading: bookingsController.bookingsDetailsModel
                                    ?.product?.productType ==
                                1
                            ? Container(
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                    color: const Color.fromARGB(71, 7, 36, 154),
                                    borderRadius: BorderRadius.circular(5)),
                                child: const Icon(
                                  Icons.headphones,
                                  size: 30,
                                  color: Color(0xff07259A),
                                ),
                              )
                            : bookingsController.bookingsDetailsModel?.product
                                        ?.productType ==
                                    2
                                ? Container(
                                    // E1CAFF
                                    height: 47,
                                    width: 47,
                                    decoration: BoxDecoration(
                                        color: const Color(0xffE1CAFF),
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Center(
                                      child: Image.asset(
                                        'assets/giftBox.png',
                                        height: 27,
                                      ),
                                    ),
                                  )
                                : bookingsController.bookingsDetailsModel
                                            ?.product?.productType ==
                                        3
                                    ? Container(
                                        // E1CAFF
                                        height: 60,
                                        width: 60,
                                        decoration: BoxDecoration(
                                            color: Color(0xffDDF4FF),
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: Center(
                                          child: Image.asset(
                                            'assets/doc.png',
                                            height: 27,
                                          ),
                                        ),
                                      )
                                    : bookingsController.bookingsDetailsModel
                                                ?.product?.productType ==
                                            4
                                        ? Container(
                                            // E1CAFF
                                            height: 60,
                                            width: 60,
                                            decoration: BoxDecoration(
                                                color: Color(0xffE2FFE3),
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            child: Center(
                                              child: Image.asset(
                                                'assets/package.png',
                                                height: 27,
                                              ),
                                            ),
                                          )
                                        : Container(
                                            // E1CAFF
                                            height: 47,
                                            width: 47,
                                            decoration: BoxDecoration(
                                                color: const Color(0xffFFECB3),
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            child: const Center(
                                                child: Icon(
                                              Icons.add,
                                              size: 30,
                                            )),
                                          ),
                        title: bookingsController.bookingsDetailsModel?.product
                                    ?.productType ==
                                1
                            ? Text('Electronics')
                            : bookingsController.bookingsDetailsModel?.product
                                        ?.productType ==
                                    2
                                ? Text('Gift')
                                : bookingsController.bookingsDetailsModel
                                            ?.product?.productType ==
                                        3
                                    ? Text('Document')
                                    : bookingsController.bookingsDetailsModel
                                                ?.product?.productType ==
                                            4
                                        ? Text('Package')
                                        : Text(""),
                        subtitle: Text(
                          '${bookingsController.bookingsDetailsModel?.product?.instructions}',
                          style: TextStyle(
                              fontSize: 12,
                              color: themeColorGrey,
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                    ),
                    Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.all(15.0),
                          child: Text(
                            'Vehicle type',
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 70,
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                              width: MediaQuery.of(context).size.width * .4,
                              child: bookingsController
                                          .bookingsModel?.vehicleType ==
                                      4
                                  ? Row(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 18.0),
                                          child: Image.asset(
                                            'assets/truck.png',
                                            height: 49,
                                            width: 49,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 18.0),
                                          child: Text(
                                            'Truck ',
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: themeColorGrey),
                                          ),
                                        ),
                                      ],
                                    )
                                  : bookingsController
                                              .bookingsModel?.vehicleType ==
                                          3
                                      ? Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 18.0),
                                              child: Image.asset(
                                                'assets/van.png',
                                                height: 49,
                                                width: 49,
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 18.0),
                                              child: Text(
                                                'Van  ',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: themeColorGrey),
                                              ),
                                            ),
                                          ],
                                        )
                                      : bookingsController
                                                  .bookingsModel?.vehicleType ==
                                              2
                                          ? Row(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 18.0),
                                                  child: Image.asset(
                                                    'assets/vehicle.png',
                                                    height: 49,
                                                    width: 49,
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 18.0),
                                                  child: Text(
                                                    'Vehicle  ',
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        color: themeColorGrey),
                                                  ),
                                                ),
                                              ],
                                            )
                                          : bookingsController.bookingsModel
                                                      ?.vehicleType ==
                                                  1
                                              ? Row(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 18.0),
                                                      child: Image.asset(
                                                        'assets/motorcycle.png',
                                                        height: 49,
                                                        width: 49,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 18.0),
                                                      child: Text(
                                                        'Motorbike',
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            color:
                                                                themeColorGrey),
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              : SizedBox()),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(15.0),
                          child: Text(
                            'Image',
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                      ],
                    ),
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
                                "$serverUrlAssets${bookingsController.bookingActiveModel?.product?.image}",
                              ),
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Text(
                            'Pickup Location',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 28.0, top: 15),
                          child: Image.asset('assets/locationblack-icon.png'),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0, top: 8),
                          child: Text(
                            '${bookingsController.bookingActiveModel?.booking?.formatedAddress}',
                            style:
                                TextStyle(color: themeColorGrey, fontSize: 14),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, top: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Text(
                            'Receiver’s Details',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 30.0, top: 15),
                          child: Image.asset('assets/locationblack-icon.png'),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0, top: 15),
                          child: Text(
                            '${bookingsController.bookingActiveModel?.receiver?.formatedAddress}',
                            style:
                                TextStyle(color: themeColorGrey, fontSize: 14),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 30.0, top: 15),
                          child: Image.asset('assets/profile.png'),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0, top: 15),
                          child: Text(
                            '${bookingsController.bookingActiveModel?.receiver?.name}',
                            style:
                                TextStyle(color: themeColorGrey, fontSize: 14),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 30.0, top: 15),
                          child: Image.asset('assets/phone-icon.png'),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0, top: 15),
                          child: Text(
                            '${bookingsController.bookingActiveModel?.receiver?.phonenumber}',
                            style:
                                TextStyle(color: themeColorGrey, fontSize: 14),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Text(
                            'Payment Method',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 28.0, top: 15),
                          child: Image.asset(
                            'assets/wallet.png',
                            height: 24,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0, top: 8),
                          child: Text(
                            'Cash',
                            style:
                                TextStyle(color: themeColorGrey, fontSize: 14),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 8.0, top: 8),
                          child: Icon(Icons.keyboard_arrow_down_outlined),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Text(
                            'Total amount',
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Text(
                            'Ksh . 350.00',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: const BoxDecoration(
                                color: Colors.amber,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                            height: 49,
                            width: 181,
                            child: Padding(
                              padding: const EdgeInsets.all(1.0),
                              child: SizedBox(
                                  height: 49,
                                  width: 181,
                                  child: TextButton(
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Colors.white)),
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const SignUp()),
                                        );
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Icon(Icons.calendar_today),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 8.0),
                                            child: Text(
                                              'Schedule',
                                              style: TextStyle(
                                                  color: themeColorAmber,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ],
                                      ))),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: SizedBox(
                              height: 49,
                              width: 181,
                              child: TextButton(
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              themeColorAmber)),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const GetADriver()),
                                    );
                                  },
                                  child: Row(
                                    children: [
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      SizedBox(
                                        width: 100,
                                        child: Center(
                                          child: Text(
                                            'Pay Ksh 350 ',
                                            style: TextStyle(
                                                color: themeColorGreen,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ),
                                      ),
                                      Icon(
                                        Icons.credit_card_rounded,
                                        color: themeColorGreen,
                                      )
                                    ],
                                  ))),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 50,
                    )
                  ],
                ),
              ),
      ),
    );
  }
}
