import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:okapy/screens/createbooking/sendPackage.dart';
import 'package:okapy/screens/utils/colors.dart';
import 'package:okapy/state/auth.dart';
import 'package:okapy/state/bookings.dart';
import 'package:place_picker/entities/entities.dart';
import 'package:place_picker/place_picker.dart';
import 'package:provider/provider.dart';
import 'dart:async';
import 'dart:math';

import 'package:google_api_headers/google_api_headers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:google_maps_webservice/places.dart';

const kGoogleApiKey = "AIzaSyDwC5mBpcztehUHa3Gfjr9m8BtbNAve1LE";

class WhereUSending extends StatefulWidget {
  const WhereUSending({Key? key}) : super(key: key);

  @override
  State<WhereUSending> createState() => _WhereUSendingState();
}

class _WhereUSendingState extends State<WhereUSending> {
  String? senderLocation;
  String? receiverLocation;
  String? name;
  String? phone;
  TextEditingController senderLoc = TextEditingController();
  TextEditingController receiverLoc = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool busy = false;

  @override
  Widget build(BuildContext context) {
    return Consumer<Bookings>(
      builder: (context, bookingController, child) => Consumer<Auth>(
        builder: (context, authcontroller, child) => Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
          ),
          backgroundColor: Colors.white,
          body: Consumer<Bookings>(
            builder: (context, bookingController, child) =>
                SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: Image.asset(
                        'assets/stepper2.png',
                        height: 30,
                      ),
                    ),
                    const Text(
                      'What are you sending ?',
                      style: TextStyle(fontSize: 20),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 1),
                      child: SizedBox(
                        width: 326,
                        child: Text(
                          "Sender’s Location",
                          style:
                              TextStyle(color: themeColorGreen, fontSize: 14),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: 326,
                        // height: s5,
                        child: TextFormField(
                          controller: senderLoc,
                          onSaved: (newValue) => senderLocation = newValue,
                          onChanged: (value) async {
                            showPlacePicker();
                            LocationResult? result = await Navigator.of(context)
                                .push(MaterialPageRoute(
                                    builder: (context) => PlacePicker(
                                        "AIzaSyDwC5mBpcztehUHa3Gfjr9m8BtbNAve1LE")));
                            bookingController.setSenderLocation(result);
                            senderLoc.text = result!.formattedAddress!;
                            // bookingController.searchLocation(location: value);
                          },
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.location_on_outlined,
                              color: themeColorGreen,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 48.0),
                          child: Image.asset(
                            'assets/d.png',
                            height: 30,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 1),
                      child: SizedBox(
                        width: 326,
                        child: Text(
                          "Receiver’s Details",
                          style:
                              TextStyle(color: themeColorGreen, fontSize: 14),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: 326,
                        // height: 45,
                        child: TextFormField(
                          controller: receiverLoc,
                          onSaved: (newValue) => receiverLocation = newValue,
                          onChanged: (value) async {
                            showPlacePicker();
                            LocationResult? result = await Navigator.of(context)
                                .push(MaterialPageRoute(
                                    builder: (context) => PlacePicker(
                                        "AIzaSyDwC5mBpcztehUHa3Gfjr9m8BtbNAve1LE")));

                            bookingController.setReceiversLocation(result!);
                            receiverLoc.text = result.formattedAddress!;
                            // bookingController.searchLocation(location: value);
                          },
                          decoration: InputDecoration(
                            // border: InputBorder()
                            hintText: 'Location',
                            prefixIcon: Icon(
                              Icons.location_on_outlined,
                              color: themeColorGreen,
                            ),
                            suffixIcon: Icon(
                              Icons.close,
                              color: themeColorGrey,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SizedBox(
                        width: 326,
                        height: 45,
                        child: TextFormField(
                          onSaved: (newValue) => name = newValue,
                          initialValue:
                              "${authcontroller.userModel!.firstName} ${authcontroller.userModel!.lastName}",
                          decoration: InputDecoration(
                              hintText: 'Name',
                              // border: InputBorder()
                              prefixIcon: Image.asset('assets/userIcon.png')),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SizedBox(
                        width: 326,
                        height: 45,
                        child: TextFormField(
                          onSaved: (newValue) => phone = newValue,
                          initialValue:
                              '${authcontroller.userModel!.phonenumber}',
                          decoration: InputDecoration(
                              hintText: 'Phone',
                              // border: InputBorder()
                              prefixIcon: Image.asset('assets/phone-icon.png')),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                    SizedBox(
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
                              _formKey.currentState!.save();

                              bookingController
                                  .setReceiverDetails(
                                      receiverLoc: receiverLoc.text,
                                      senderLocation: senderLoc.text,
                                      name: name!,
                                      phone: phone!)
                                  .then((value) {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                  content: Text(
                                      "Receiver Deatails Recorded Successfully."),
                                ));
                                // print(value);
                                setState(() {
                                  busy = false;
                                });
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const SendPackage()),
                                );
                              }).catchError((value) {
                                // print(value);
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
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void showPlacePicker() async {
    LocationResult? result = await Navigator.of(context).push(MaterialPageRoute(
        builder: (context) =>
            PlacePicker("AIzaSyDwC5mBpcztehUHa3Gfjr9m8BtbNAve1LE")));

    // Handle the result in your way
    print(result);
  }
}
