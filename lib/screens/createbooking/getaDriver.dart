import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_maps_widget/google_maps_widget.dart';
import 'package:okapy/page/dummy.dart';
import 'package:okapy/screens/home/slider.dart';
import 'package:okapy/screens/home/tabs.dart';
import 'package:okapy/screens/utils/colors.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class GetADriver extends StatefulWidget {
  const GetADriver({Key? key}) : super(key: key);

  @override
  State<GetADriver> createState() => _GetADriverState();
}

class _GetADriverState extends State<GetADriver> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      drawer: Drawer(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30.0, bottom: 20),
            child: Image.asset('assets/logo-01.png'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  'assets/av1.png',
                  height: 100,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      const Text(
                        'Muhu Njenga',
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      TextButton(
                        onPressed: () {},
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
          Padding(
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
          Padding(
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
                onPressed: () {},
                child: const Text(
                  "Logout",
                  style: TextStyle(color: Color(0xffBB1600), fontSize: 16),
                )),
          )
        ],
      ) // Populate the Drawer in the next step.
          ),
      body: Stack(
        children: [
          HomePage3(),
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
                  child: const Icon(
                    Icons.menu,
                    size: 30,
                  )),
            ),
          ),
        ],
      ),
    );
  }
}

class HomePage3 extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage3> {
  final double _initFabHeight = 120.0;
  double _fabHeight = 0;
  double _panelHeightOpen = 0;
  double _panelHeightClosed = 95.0;

  @override
  void initState() {
    super.initState();

    _fabHeight = _initFabHeight;
  }

  @override
  Widget build(BuildContext context) {
    _panelHeightOpen = MediaQuery.of(context).size.height * .80;

    return Material(
      child: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          SlidingUpPanel(
            maxHeight: _panelHeightOpen,
            minHeight: _panelHeightClosed,
            parallaxEnabled: true,
            parallaxOffset: .5,
            body: _body(),
            panelBuilder: (sc) => _panel(sc),
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
                      )))),

          //the SlidingUpPanel Title
        ],
      ),
    );
  }

  Widget _panel(ScrollController sc) {
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
                  child: Center(
                    child: Text(
                      "Great ! Now let us get you a driver",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),
            const LinearProgressIndicator(
              value: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                leading: Image.asset(
                  'assets/1.png',
                  height: 75,
                  // width: 75,
                ),
                title: Text('Groceries'),
                subtitle: Text(
                  'Brooke Manor, Lower Kabete ',
                  style: TextStyle(fontSize: 13),
                ),
                trailing: Text(
                  'Ksh.450',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            )
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
      apiKey: "AIzaSyDwC5mBpcztehUHa3Gfjr9m8BtbNAve1LE",
      sourceLatLng: const LatLng(40.484000837597925, -3.369978368282318),
      destinationLatLng: const LatLng(40.48017307700204, -3.3618026599287987),
      routeWidth: 5,
      routeColor: themeColorAmber,
      destinationMarkerIconInfo: const MarkerIconInfo(
          assetPath: 'assets/flag.png', assetMarkerSize: Size.square(100)),
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
    );
  }
}
