import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:okapy/models/BookingsDetailsModel.dart';
import 'package:okapy/models/bookingModel.dart';
import 'package:okapy/screens/outgoin/outgoing.dart';
import 'package:okapy/screens/utils/colors.dart';
import 'package:okapy/state/bookings.dart';
import 'package:provider/provider.dart';

class Mybooking extends StatefulWidget {
  const Mybooking({Key? key}) : super(key: key);

  @override
  State<Mybooking> createState() => _MybookingState();
}

class _MybookingState extends State<Mybooking> {
  String? _others;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Text('My Bookings'),
          actions: const [Icon(Icons.search, size: 22)]),
      body: Consumer<Bookings>(
        builder: (context, bookingsController, child) => bookingsController.busy
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Column(
                  children: [
                    ...bookingsController.bookingsList
                        .map(
                          (booking) => BookingMyBooking(
                            bookingsController: bookingsController,
                            booking: booking,
                          ),
                        )
                        .toList(),
                  ],
                ),
              ),
      ),
    );
  }
}

class BookingMyBooking extends StatefulWidget {
  final Bookings bookingsController;
  final BookingsModel booking;
  const BookingMyBooking({
    Key? key,
    required this.bookingsController,
    required this.booking,
  }) : super(key: key);

  @override
  State<BookingMyBooking> createState() => _BookingMyBookingState();
}

class _BookingMyBookingState extends State<BookingMyBooking> {
  BookingDetailsModel? _bookingDetailsModel;
  @override
  void initState() {
    // TODO: implement initState
    getStuff();
    super.initState();
  }

  getStuff() {
    Future l =
        widget.bookingsController.getBookingDetailID(id: widget.booking.id!);
    l.then((value) {
      print(value.data);
      _bookingDetailsModel = BookingDetailsModel.fromJson(value.data);
      setState(() {
        _bookingDetailsModel = BookingDetailsModel.fromJson(value.data);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        widget.bookingsController.getBookingDetailsId(id: widget.booking.id!);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Outgoing()),
        );
      },
      leading: _bookingDetailsModel?.product?.productType == 1
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
          : _bookingDetailsModel?.product?.productType == 2
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
              : _bookingDetailsModel?.product?.productType == 3
                  ? Container(
                      // E1CAFF
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                          color: const Color(0xffDDF4FF),
                          borderRadius: BorderRadius.circular(5)),
                      child: Center(
                        child: Image.asset(
                          'assets/doc.png',
                          height: 27,
                        ),
                      ),
                    )
                  : _bookingDetailsModel?.product?.productType == 4
                      ? Container(
                          // E1CAFF
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                              color: const Color(0xffE2FFE3),
                              borderRadius: BorderRadius.circular(5)),
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
                              borderRadius: BorderRadius.circular(5)),
                          child: const Center(
                              child: Icon(
                            Icons.add,
                            size: 30,
                          )),
                        ),

      title: _bookingDetailsModel?.product?.productType == 1
          ? const Text('Electronics',)
          : _bookingDetailsModel?.product?.productType == 2
              ? const Text('Gift')
              : _bookingDetailsModel?.product?.productType == 3
                  ? const Text('Document')
                  : _bookingDetailsModel?.product?.productType == 4
                      ? const Text('Package')
                      : const Text(""),
      // subtitle: Text('2 Aug 2022'),
      subtitle: Text(
        widget.booking.bookingId!,
        style: TextStyle(
            color: themeColorGreen, fontSize: 14, fontWeight: FontWeight.w600),
      ),
    );
  }
}
