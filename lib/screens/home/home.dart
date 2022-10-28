import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_widget/google_maps_widget.dart';
import 'package:okapy/page/dummy.dart';
import 'package:okapy/screens/home/components/drawer.dart';
import 'package:okapy/screens/home/slider.dart';
import 'package:okapy/screens/home/tabs.dart';
import 'package:okapy/screens/mybooking/mybooking.dart';
import 'package:okapy/screens/notifications/notifications.dart';
import 'package:okapy/screens/partners/partners.dart';
import 'package:okapy/screens/payment/payment.dart';
import 'package:okapy/screens/profile/editProfile.dart';
import 'package:okapy/screens/utils/colors.dart';
import 'package:okapy/state/auth.dart';
import 'package:okapy/state/bookings.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Consumer<Auth>(
      builder: (context, authController, child) => Consumer<Bookings>(
        builder: (context, bookingsController, child) => Scaffold(
          key: _key,
          drawer: drawer(authController, context, bookingsController),
          body: Stack(
            children: [
              HomePage2(),
              // maps(context),
              Positioned(
                top: 30,
                left: 15,
                child: InkWell(
                  onTap: () {
                    _key.currentState!.openDrawer();
                  },
                  child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      // child: const Icon(
                      //   Icons.menu,
                      //   size: 30,
                      // )
                      child: const Icon(
                        Icons.menu,
                        size: 30,
                      )),
                ),
              ),
              Positioned(
                  right: 1,
                  top: MediaQuery.of(context).size.height / 2,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FloatingActionButton(
                      heroTag: 'nextp123',
                      elevation: 1,
                      backgroundColor: Colors.white,
                      onPressed: () {
                        bookingsController.bookingNext();
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(builder: (context) => Home()),
                        // );
                      },
                      child: const Icon(Icons.arrow_forward_ios),
                    ),
                  )),
              bookingsController.bookingPrev != null
                  ? Positioned(
                      left: 1,
                      top: MediaQuery.of(context).size.height / 2,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FloatingActionButton(
                          heroTag: 'nextp123',
                          elevation: 1,
                          backgroundColor: Colors.white,
                          onPressed: () {
                            bookingsController.bookingprevF();
                            Navigator.pop(context);
                          },
                          child: const Icon(Icons.arrow_back_ios),
                        ),
                      ))
                  : SizedBox(),
            ],
          ),
        ),
      ),
    );
  }

  Stack mainStack(BuildContext context) {
    return Stack(
      children: [
        maps(context),
        Positioned(
          top: 30,
          left: 15,
          child: InkWell(
            onTap: () {
              _key.currentState!.openDrawer();
            },
            child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: const Icon(
                  Icons.menu,
                  size: 30,
                )),
          ),
        ),
      ],
    );
  }

  Column maps(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height / 2.7,
          width: MediaQuery.of(context).size.width,
          child: GoogleMapsWidget(
            apiKey: "AIzaSyDwC5mBpcztehUHa3Gfjr9m8BtbNAve1LE",
            sourceLatLng: const LatLng(40.484000837597925, -3.369978368282318),
            destinationLatLng:
                const LatLng(40.48017307700204, -3.3618026599287987),
            routeWidth: 5,
            routeColor: themeColorAmber,
            destinationMarkerIconInfo: const MarkerIconInfo(
                assetPath: 'assets/flag.png',
                assetMarkerSize: Size.square(100)),
            sourceMarkerIconInfo: const MarkerIconInfo(
                assetPath: "assets/start.png", assetMarkerSize: Size.square(100)
                // assetMarkerSize: Size.square(12)
                ),
            updatePolylinesOnDriverLocUpdate: true,
            sourceName: "This is source name",
            driverName: "Alex",
            onTapDriverMarker: (currentLocation) {
              print("Driver is currently at $currentLocation");
            },
            totalTimeCallback: (time) => print(time),
            totalDistanceCallback: (distance) => print(distance),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * .5,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 20, left: 25),
                child: Text(
                  'Bookings',
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
              ),
              Image.asset('assets/EmptyState.png'),
              HomeTabs()
            ],
          ),
        )
      ],
    );
  }
}
