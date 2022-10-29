import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:okapy/core/api.dart';
import 'package:okapy/core/locator.dart';
import 'package:okapy/models/BookingsDetailsModel.dart';
import 'package:okapy/models/auth.dart';
import 'package:okapy/models/bookingModel.dart';
import 'package:okapy/models/partners.dart';
import 'package:okapy/models/product.dart';
import 'package:okapy/models/userModel.dart';
import 'package:okapy/state/auth.dart';
import 'package:place_picker/entities/entities.dart';

class Bookings extends ChangeNotifier {
  bool _busy = false;
  bool get busy => _busy;
  bool _busyF = false;
  bool get busyF => _busy;
  bool adding_product = false;

  bool _errorInitializingBooking = false;

  Api _api = locator<Api>();
  final List<PartnerModel> _partners = [];
  List<PartnerModel> get partners => _partners;
  // List<Placemark> SendersLocation
  List<Placemark> _sendersLocation = [];
  List<Placemark> get sendersLocation => _sendersLocation;
  LatLng? _sendersLatlang;
  LatLng? get sendersLatlang => _sendersLatlang;
  Auth _auth = locator<Auth>();
  List<BookingsModel> _bookingsList = [];
  List<BookingsModel> get bookingsList => _bookingsList;
  BookingDetailsModel? _bookingActiveModel;
  BookingDetailsModel? get bookingActiveModel => _bookingActiveModel;
  BookingsModel? _bookingsModel;
  BookingsModel? get bookingsModel => _bookingsModel;
  BookingDetailsModel? _bookingsDetailsModel;
  BookingDetailsModel? get bookingsDetailsModel => _bookingActiveModel;//_bookingsDetailsModel;
  ProctuctsModel? _proctuctsModel;
  ProctuctsModel? get proctuctsModel => _proctuctsModel;
  LocationResult? _senderLocation;
  LocationResult? get senderLocation => _senderLocation;
  LocationResult? _receiverLocation;
  LocationResult? get reverLocation => _receiverLocation;
  int _bookingActive = 0;
  int get bookingActive => _bookingActive;
  int? _bookingPrev;
  int? get bookingPrev => _bookingPrev;

  bool _activeBookingBusy = false;
  bool get activeBookingBusy => _activeBookingBusy;

  String _formatedDate = '';
  String get formatedDate => _formatedDate;
  BookingDetailsModel? _bookingsDetailsModelActive;
  BookingDetailsModel? get bookingsDetailsModelActive => _bookingActiveModel; //_bookingsDetailsModel;
  Bookings() {
    getpartners();
    getallBookings();
  }

  bookingNext() {
    if (_bookingActive == (_bookingsList.length - 1)) {
    } else {
      _bookingPrev = _bookingActive;
      _bookingActive = _bookingActive + 1;

      getBookingDetail(id: _bookingsList[_bookingActive].id!);
      notifyListeners();
    }
  }

  bookingprevF() {
    if (_bookingActive == 0) {
    } else {
      _bookingPrev = _bookingActive - 2;
      _bookingActive = _bookingActive - 1;

      getBookingDetail(id: _bookingsList[_bookingActive].id!);
      notifyListeners();
    }
  }

  setSenderLocation(LocationResult? location) {
    _senderLocation = location;
    notifyListeners();
  }

  setReceiversLocation(LocationResult? location) {
    _receiverLocation = location;
    notifyListeners();
  }

  getallBookings() async {
    _busy = true;
    _bookingsList.clear();
    notifyListeners();
    await _api.getData(endpoint: 'bookings/api/bookings/').then((value) {
      for (var i = 0; i < value.data.length; i++) {
        _bookingsList.add(BookingsModel.fromJson(value.data[i]));
      }
      notifyListeners();
    });
    _busy = false;
    notifyListeners();
  }

  getpartners() async {
    _busy = true;
    _partners.clear();
    notifyListeners();
    return await _api.getData(endpoint: 'partners/api/').then((value) {
      print(value.data);
      for (var i = 0; i < value.data.length; i++) {
        _partners.add(PartnerModel.fromJson(value.data[i]));
      }
      _busy = false;
      notifyListeners();
    });
  }

  initializeBooking({required UserModel auth}) async {
    _busy = true;
    _errorInitializingBooking = false;
    notifyListeners();
    await _api.postHeaders(url: "bookings/api/bookings/", data: {
      'owner': auth.id,
    }).then((value) {
      print(value.data);
      _bookingsModel = BookingsModel.fromJson(value.data);
      notifyListeners();
    }).catchError((error, stackTrace) {
      _errorInitializingBooking = true;
    });
    _busy = false;
    notifyListeners();
  }

  setSendersLocation({required double lat, required double lang}) {
    _sendersLatlang = LatLng(lat, lang);
    notifyListeners();
  }

  bool errorInitializingBooking() {
    return _errorInitializingBooking;
  }

  Future bookingsProduct(
      {File? doc, String? productID, String? instructions}) async {
    adding_product = true;
    notifyListeners();

    return await _api
        .postHeadersFormData(
            url: 'bookings/api/products/',
            data: FormData.fromMap({
              "product_type": productID,
              "instructions": instructions,
              "booking": bookingsModel!.id,
              "image": await MultipartFile.fromFile(doc!.path,
                  filename: doc.path.split('/').last),
            }))
        .then((value) {
      _proctuctsModel = ProctuctsModel.fromJson(value.data);
      adding_product = false;
      notifyListeners();
      return true;
    }).catchError((onError) {
      adding_product = false;
      return false;
    });
  }

  Future setReceiverDetails(
      {String? receiverLoc,
      String? senderLocation,
      required String name,
      required String phone}) async {
    _formatedDate = senderLocation!;
    print({
      "name": name,
      "phonenumber": phone,
      "formated_address": receiverLoc,
      "latitude": reverLocation!.latLng?.latitude,
      "longitude": reverLocation!.latLng?.longitude,
      "booking": bookingsModel?.id,
    });
    notifyListeners();
    return await _api.postHeaders(url: 'bookings/api/receiver/', data: {
      "name": name,
      "phonenumber": phone,
      "formated_address": receiverLoc,
      "latitude": reverLocation!.latLng?.latitude,
      "longitude": reverLocation!.latLng?.longitude,
      "booking": bookingsModel?.id,
    }).then((value) {
      return true;
    }).catchError((onError) {
      return throw false;
    });
  }

  Future patchVehicle({required int vehivleId, required int authId}) async {
    print(formatedDate);
    print({
      "vehicle_type": vehivleId,
      "formated_address": formatedDate,
      "latitude": senderLocation?.latLng?.latitude,
      "longitude": senderLocation?.latLng?.longitude,
      "owner": authId,
      'id': bookingsModel?.id
    });
    return await _api.patch(url: 'bookings/api/bookings/', data: {
      "vehicle_type": vehivleId,
      "formated_address": formatedDate,
      "latitude": senderLocation?.latLng?.latitude,
      "longitude": senderLocation?.latLng?.longitude,
      "owner": authId,
      'id': bookingsModel?.id
    }).then((value) {
      _bookingsModel = BookingsModel.fromJson(value.data);

      notifyListeners();
      return true;
    }).catchError((onError) {
      return throw false;
    });
  }

  Future<bool> getBookingDetails() async {
    _busy = true;

    notifyListeners();

    try {
      var value = await _api.getData(
          endpoint: 'bookings/api/confirm/${bookingsModel?.id}');
      _bookingActiveModel = BookingDetailsModel.fromJson(value.data);
      _busy = false;
      notifyListeners();
      return true;
    } catch (e) {
      _busy = false;
      notifyListeners();

      return false;
    }
  }

  getBookingDetail({required int id}) async {
    id = 16;
    _activeBookingBusy = true;
    notifyListeners();
    await _api.getData(endpoint: 'bookings/api/confirm/$id').then((value) {
      print(value.data);
      print('details');
      _bookingsDetailsModel = BookingDetailsModel.fromJson(value.data);
    });
    _activeBookingBusy = false;
    notifyListeners();
  }

  getBookingDetailID({required int id}) async {
    return await _api.getData(endpoint: 'bookings/api/confirm/$id');
  }

  getBookingDetailsId({required int id}) async {
    _busy = true;
    notifyListeners();
    await _api.getData(endpoint: 'bookings/api/confirm/$id').then((value) {

      print("booking details ----------------------${value}");
      _bookingActiveModel = BookingDetailsModel.fromJson(value.data);
    });
    _busy = false;
    notifyListeners();
  }

  getLocationDetails({required double lat, required double long}) async {
    // get
    List<Placemark> placemarks =
        await placemarkFromCoordinates(52.2165157, 6.9437819);
    print(placemarks.toList());
    // _api.getRawUrl(url: "https://maps.googleapis.com/maps/api/place/autocomplete/json?&types=establishment&location=37.76999%2C-122.44696&radius=500&key=AIzaSyDwC5mBpcztehUHa3Gfjr9m8BtbNAve1LE")
  }
}
