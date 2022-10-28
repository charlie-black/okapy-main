import 'package:flutter/material.dart';
import 'package:okapy/models/product.dart';
import 'package:okapy/screens/createbooking/confirmbooking.dart';
import 'package:okapy/screens/createbooking/createbooking.dart';
import 'package:okapy/screens/utils/colors.dart';
import 'package:okapy/state/auth.dart';
import 'package:okapy/state/bookings.dart';
import 'package:provider/provider.dart';

class SendPackage extends StatefulWidget {
  const SendPackage({Key? key}) : super(key: key);

  @override
  State<SendPackage> createState() => _SendPackageState();
}

class _SendPackageState extends State<SendPackage> {
  int? active;
  bool busy = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarCustom(''),
      body: Consumer<Bookings>(
        builder: (context, bookingsController, child) => SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Center(
                  child: Image.asset(
                    'assets/stepper3.png',
                    height: 30,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  '  you send the product?',
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(
                  height: 30,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      active = 1;
                    });
                  },
                  child: SizedBox(
                    height: 70,
                    child: Container(
                      color: active == 1
                          ? themeColorAmber.withOpacity(.2)
                          : Colors.transparent,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * .4,
                            child: Row(
                              children: [
                                Image.asset(
                                  'assets/motorcycle.png',
                                  height: 49,
                                  width: 49,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 18.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text(
                                        'Motorbike',
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.black),
                                      ),
                                      Text(
                                        '4 Min ',
                                        style: TextStyle(
                                            fontSize: 11,
                                            color: themeColorGrey),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Text(
                            'Ksh.150',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      active = 2;
                    });
                  },
                  child: SizedBox(
                    height: 70,
                    child: Container(
                      color: active == 2
                          ? themeColorAmber.withOpacity(.2)
                          : Colors.transparent,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * .4,
                            child: Row(
                              children: [
                                Image.asset(
                                  'assets/vehicle.png',
                                  height: 49,
                                  width: 49,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 18.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text(
                                        'Vehicle',
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.black),
                                      ),
                                      Text(
                                        '4 Min ',
                                        style: TextStyle(
                                            fontSize: 11,
                                            color: themeColorGrey),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Text(
                            'Ksh.200',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      active = 3;
                    });
                  },
                  child: SizedBox(
                    height: 70,
                    child: Container(
                      color: active == 3
                          ? themeColorAmber.withOpacity(.2)
                          : Colors.transparent,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * .4,
                            child: Row(
                              children: [
                                Image.asset(
                                  'assets/van.png',
                                  height: 49,
                                  width: 49,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 18.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text(
                                        'Van',
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.black),
                                      ),
                                      Text(
                                        '4 Min ',
                                        style: TextStyle(
                                            fontSize: 11,
                                            color: themeColorGrey),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Text(
                            'Ksh.300',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      active = 4;
                    });
                  },
                  child: SizedBox(
                    height: 70,
                    child: Container(
                      color: active == 4
                          ? themeColorAmber.withOpacity(.2)
                          : Colors.transparent,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * .4,
                            child: Row(
                              children: [
                                Image.asset(
                                  'assets/truck.png',
                                  height: 49,
                                  width: 49,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 18.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text(
                                        'Truck',
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.black),
                                      ),
                                      Text(
                                        '4 Min ',
                                        style: TextStyle(
                                            fontSize: 11,
                                            color: themeColorGrey),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Text(
                            'Ksh.400',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
                Consumer<Auth>(
                  builder: (context, authController, child) => SizedBox(
                      height: 49,
                      width: 326,
                      child: TextButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(themeColorAmber)),
                          onPressed: () {
                            setState(() {
                              busy = true;
                            });
                            bookingsController
                                .patchVehicle(
                                    vehivleId: active!,
                                    authId: authController.userModel!.id!)
                                .then((value) {
                              setState(() {
                                busy = false;
                              });
                              bookingsController.getBookingDetails();
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //       builder: (context) => const SendPackage()),
                              // );

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ConfirmBooking()),
                              );
                            }).catchError((onError) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content: Text(
                                    "An Error Happened Try again Later !."),
                              ));
                              setState(() {
                                busy = false;
                              });
                            });
                          },
                          child: busy
                              ? const Center(
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                  ),
                                )
                              : Row(
                                  children: [
                                    const SizedBox(
                                      width: 50,
                                    ),
                                    SizedBox(
                                      width: 200,
                                      child: Center(
                                        child: Text(
                                          'Next',
                                          style: TextStyle(
                                              color: themeColorGreen,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      color: themeColorGreen,
                                    )
                                  ],
                                ))),
                ),
                const SizedBox(
                  height: 60,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
