import 'package:flutter/material.dart';
import 'package:okapy/screens/authentication/login.dart';
import 'package:okapy/screens/mybooking/mybooking.dart';
import 'package:okapy/screens/notifications/notifications.dart';
import 'package:okapy/screens/partners/partners.dart';
import 'package:okapy/screens/payment/payment.dart';
import 'package:okapy/screens/profile/editProfile.dart';
import 'package:okapy/screens/utils/colors.dart';
import 'package:okapy/state/auth.dart';
import 'package:okapy/state/bookings.dart';
import 'package:provider/provider.dart';

Drawer drawer(
    Auth authController, BuildContext context, Bookings bookingsController) {
  return Drawer(
      child: Column(
    children: [
      Padding(
        padding: const EdgeInsets.only(top: 30.0, bottom: 20),
        child: Image.asset('assets/logo-01.png'),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: authController.busy
            ? const CircularProgressIndicator()
            : Row(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.network(
                    authController.userModel!.image!,
                    height: 100,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Text(
                          '${authController.userModel!.firstName} ${authController.userModel!.lastName}',
                          style: const TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const EditProfile()),
                            );
                          },
                          child: const Text('Edit Profile'),
                        )
                      ],
                    ),
                  )
                ],
              ),
      ),
      const Divider(
        height: 2,
      ),
      // Spacer(),
      const SizedBox(
        height: 20,
      ),
      Consumer<Bookings>(
        builder: (context, bookingsController, child) => InkWell(
          onTap: () {
            bookingsController.getallBookings();
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Mybooking()),
            );
          },
          child: Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * .18),
                  child: Image.asset(
                    'assets/timer.png',
                    height: 20,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 15.0),
                  child: Text(
                    'My Bookings',
                    style: TextStyle(fontSize: 16),
                  ),
                )
              ],
            ),
          ),
        ),
      ),

      const SizedBox(
        height: 20,
      ),
      InkWell(
        onTap: () {
          bookingsController.getpartners();
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Patners()),
          );
        },
        child: Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * .18),
                child: Image.asset(
                  'assets/cart.png',
                  height: 20,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Text(
                  'Partners',
                  style: TextStyle(fontSize: 16),
                ),
              )
            ],
          ),
        ),
      ),
      const SizedBox(
        height: 20,
      ),
      Padding(
        padding: const EdgeInsets.only(top: 15.0),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * .18),
              child: Image.asset(
                'assets/calender.png',
                height: 20,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15.0),
              child: Text(
                'Schedule Booking',
                style: TextStyle(fontSize: 16),
              ),
            )
          ],
        ),
      ),
      const SizedBox(
        height: 20,
      ),
      InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Payments()),
          );
        },
        child: Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * .18),
                child: Image.asset(
                  'assets/payment.png',
                  height: 20,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Text(
                  'Payment',
                  style: TextStyle(fontSize: 16),
                ),
              )
            ],
          ),
        ),
      ),
      const SizedBox(
        height: 20,
      ),
      InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Notifications()),
          );
        },
        child: Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * .18),
                child: Image.asset(
                  'assets/notification.png',
                  height: 20,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Text(
                  'Notifications',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                      color: themeColorAmber,
                      borderRadius: BorderRadius.circular(10)),
                  child: const Center(
                    child: Text(
                      '5',
                      style: TextStyle(fontSize: 10),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      const Spacer(),
      const Divider(
        height: 2,
      ),
      const SizedBox(
        height: 10,
      ),
      Text(
        'Version 1.1',
        style: TextStyle(fontSize: 12, color: themeColorGrey),
      ),
      Padding(
        padding: const EdgeInsets.all(12.0),
        child: TextButton(
            onPressed: () {
              authController.logout();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Login()),
              );
            },
            child: const Text(
              "Logout",
              style: TextStyle(color: Color(0xffBB1600), fontSize: 16),
            )),
      )
    ],
  ) // Populate the Drawer in the next step.
      );
}
