import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_widget/google_maps_widget.dart';
import 'package:okapy/screens/createbooking/createbooking.dart';
import 'package:okapy/screens/home/components/recent_bookings.dart';
import 'package:okapy/screens/home/tabs.dart';
import 'package:okapy/screens/utils/colors.dart';
import 'package:okapy/state/auth.dart';
import 'package:okapy/state/bookings.dart';
import 'package:provider/provider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:flutter/services.dart';

import 'package:cached_network_image/cached_network_image.dart';

class HomePage2 extends StatefulWidget {
  HomePage2({
    Key? key,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage2> {
  final double _initFabHeight = 400.0;
  double _fabHeight = 0;
  double _panelHeightOpen = 0;
  double _panelHeightClosed = 95.0;
  bool hasJob = false;
   double? long ;
   double? lat ;



  @override
  void initState() {
    getLocation();
    super.initState();

    // print(widget.id);
    // print(widget.id);
    // print('widget.id');
    // widget.bookingsController.getBookingDetail(id: widget.id);

    _fabHeight = _initFabHeight;
  }





   getLocation() async {
    LocationPermission per = await Geolocator.checkPermission();
    if (per == LocationPermission.denied ||
        per == LocationPermission.deniedForever) {
      print("permission denied");
      LocationPermission per1 = await Geolocator.requestPermission();

    } else {
      Position currentLoc = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best);
      setState(() {
        long = currentLoc.longitude;
        lat = currentLoc.latitude;


      });

    }

  }



  @override
  Widget build(BuildContext context) {
    _panelHeightOpen = MediaQuery.of(context).size.height * .40;



    return Scaffold(
      body: Consumer<Bookings>(
        builder: (context, bookingsController, child) => Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            SlidingUpPanel(
              maxHeight: MediaQuery.of(context).size.height * .7,
              minHeight: _panelHeightClosed,
              parallaxEnabled: true,
              parallaxOffset: .5,
              body: _body(),
              panelBuilder: (sc) => _panel(sc, bookingsController),
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(18.0),
                  topRight: Radius.circular(18.0)),
              onPanelSlide: (double pos) => setState(() {
                _fabHeight = pos * (_panelHeightOpen - _panelHeightClosed) +
                    _initFabHeight;
              }),
            ),

            // the fab
            Positioned(
              right: 20.0,
              bottom: _fabHeight,
              child: FloatingActionButton(
                child: Icon(
                  Icons.gps_fixed,
                  color: Theme.of(context).primaryColor,
                ),
                onPressed: () {},
                backgroundColor: Colors.white,
              ),
            ),

            Positioned(
              top: 0,
              child: ClipRRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).padding.top,
                    color: Colors.transparent,
                  ),
                ),
              ),
            ),

            //the SlidingUpPanel Title
          ],
        ),
      ),
    );
  }

  Widget _panel(ScrollController sc, Bookings bookingsController) {
    return MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: ListView(
          controller: sc,
          children: <Widget>[
            const SizedBox(
              height: 12.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 30,
                  height: 5,
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius:
                          const BorderRadius.all(Radius.circular(12.0))),
                ),
              ],
            ),
            const SizedBox(
              height: 18.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 25.0),
                  child: Text(
                    "Bookings",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 26.0,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 5.0,
            ),
            bookingsController.activeBookingBusy
                ? const Center(child: CircularProgressIndicator())
                : bookingsController.bookingsDetailsModelActive == null
                    ? const SizedBox()
                    : const HomeTabs(),
            bookingsController.bookingsList.isEmpty
                ? Column(
                    children: [
                      Image.asset(
                        'assets/EmptyState.png',
                        height: 140,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'No Bookings',
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text('Start by Creating '),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text('a booking below '),
                        ],
                      ),
                    ],
                  )
                : SizedBox(),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: SizedBox(
                    width: 326,
                    height: 49,
                    child: Consumer<Auth>(
                      builder: (context, authController, child) => TextButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(themeColorAmber)),
                          onPressed: () async {
                            // authController.getUser();
                            if (authController.userModel == null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text(
                                          "Auth failed, Logout and Login")));
                            } else {
                              bookingsController.initializeBooking(
                                  auth: authController.userModel!);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const Createbooking()),
                              );
                            }
                          },
                          child: const Text(
                            'Create bookings',
                            style: TextStyle(
                                color: Color(0xff1A411D), fontSize: 14),
                          )),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                )
              ],
            )

            //
          ],
        ));
  }

  Widget _button(String label, IconData icon, Color color) {
    return Column(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(16.0),
          child: Icon(
            icon,
            color: Colors.white,
          ),
          decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
              boxShadow: const [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.15),
                  blurRadius: 8.0,
                )
              ]),
        ),
        const SizedBox(
          height: 12.0,
        ),
        Text(label),
      ],
    );
  }

  Widget _body() {
    return GoogleMapsWidget(
      defaultCameraLocation:LatLng(lat??0,long??0) ,
      defaultCameraZoom: 0.0,
      apiKey: "AIzaSyDwC5mBpcztehUHa3Gfjr9m8BtbNAve1LE",
      sourceLatLng:  LatLng(lat!,long!),
      destinationLatLng:  LatLng(lat!,long!),
      routeWidth: 5,
      routeColor: Colors.transparent,
      // destinationMarkerIconInfo: const MarkerIconInfo(
      //     assetPath: 'assets/flag.png', assetMarkerSize: Size.square(100)),
      // sourceMarkerIconInfo: const MarkerIconInfo(
      //     assetPath: "assets/start.png", assetMarkerSize: Size.square(100)
      //     // assetMarkerSize: Size.square(12)
      //     ),
      updatePolylinesOnDriverLocUpdate: true,
      sourceName: "This is source name",
      driverName: "Alex",
      onTapDriverMarker: (currentLocation) {
        print("Driver is currently at $currentLocation");
      },
      totalTimeCallback: (time) => print(time),
      totalDistanceCallback: (distance) => print(distance),
    );
  }
}
