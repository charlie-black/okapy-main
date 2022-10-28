import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:okapy/screens/createbooking/whereuSending.dart';
import 'package:okapy/screens/utils/colors.dart';
import 'package:okapy/state/bookings.dart';
import 'package:provider/provider.dart';

class Createbooking extends StatefulWidget {
  const Createbooking({Key? key}) : super(key: key);

  @override
  State<Createbooking> createState() => _CreatebookingState();
}

class _CreatebookingState extends State<Createbooking> {
  String? productName;
  bool others = false;
  File? _doc;
  String? instructions;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarCustom(''),
      body: Consumer<Bookings>(
        builder: (context, bookingsController, child) => bookingsController.busy
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: Image.asset(
                          'assets/stack1.png',
                          height: 30,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'What are you sending ?',
                        style: TextStyle(fontSize: 20),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                productName = '1';
                                others = false;
                              });
                            },
                            child: Column(
                              children: [
                                Container(
                                  height: 47,
                                  width: 47,
                                  decoration: BoxDecoration(
                                      color:
                                          const Color.fromARGB(71, 7, 36, 154),
                                      borderRadius: BorderRadius.circular(5)),
                                  child: const Icon(
                                    Icons.headphones,
                                    size: 30,
                                    color: Color(0xff07259A),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  'Electronics',
                                  style: TextStyle(fontSize: 10),
                                )
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                productName = '2';
                                others = false;
                              });
                            },
                            child: Column(
                              children: [
                                Container(
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
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  'Gift',
                                  style: TextStyle(fontSize: 10),
                                )
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                productName = '3';
                                others = false;
                              });
                            },
                            child: Column(
                              children: [
                                Container(
                                  // E1CAFF
                                  height: 47,
                                  width: 47,
                                  decoration: BoxDecoration(
                                      color: Color(0xffDDF4FF),
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Center(
                                    child: Image.asset(
                                      'assets/doc.png',
                                      height: 27,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  'Document',
                                  style: TextStyle(fontSize: 10),
                                ),
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                productName = '4';
                                others = false;
                              });
                            },
                            child: Column(
                              children: [
                                Container(
                                  // E1CAFF
                                  height: 47,
                                  width: 47,
                                  decoration: BoxDecoration(
                                      color: Color(0xffE2FFE3),
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Center(
                                    child: Image.asset(
                                      'assets/package.png',
                                      height: 27,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  'Package',
                                  style: TextStyle(fontSize: 10),
                                ),
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                others = true;
                              });
                            },
                            child: Column(
                              children: [
                                Container(
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
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  'Others',
                                  style: TextStyle(fontSize: 10),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      others == false
                          ? SizedBox()
                          : Padding(
                              padding:
                                  const EdgeInsets.only(top: 10.0, bottom: 1),
                              child: SizedBox(
                                width: 326,
                                child: Text(
                                  "Product type",
                                  style: TextStyle(
                                      color: themeColorGreen, fontSize: 14),
                                ),
                              ),
                            ),
                      others == false
                          ? SizedBox()
                          : Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                width: 326,
                                height: 45,
                                child: TextFormField(
                                  onSaved: (newValue) => productName,
                                  decoration: const InputDecoration(
                                      // border: InputBorder()

                                      ),
                                ),
                              ),
                            ),
                      const SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0, bottom: 1),
                        child: SizedBox(
                          width: 326,
                          child: Text(
                            "Product Image",
                            style:
                                TextStyle(color: themeColorGreen, fontSize: 14),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: () async {
                              FilePickerResult? result =
                                  await FilePicker.platform.pickFiles();
                              if (result != null) {
                                PlatformFile file = result.files.first;

                                _doc = File(file.path!);
                              } else {
                                // User canceled the picker
                              }
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Image.asset(
                                'assets/addImage.png',
                                width: 152,
                                height: 75,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0, bottom: 1),
                        child: SizedBox(
                          width: 326,
                          child: Text(
                            "Instructions (Optional)",
                            style:
                                TextStyle(color: themeColorGreen, fontSize: 14),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(20.0),
                        child: SizedBox(
                          width: 387,
                          height: 131,
                          child: TextField(
                            maxLines: 300,
                            keyboardType: TextInputType.multiline,
                            onChanged: (value) => instructions = value,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      SizedBox(
                          height: 49,
                          width: 326,
                          child: TextButton(
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      themeColorAmber)),
                              onPressed: () {
                                bookingsController
                                    .bookingsProduct(
                                        doc: _doc!,
                                        productID: productName!,
                                        instructions: instructions!)
                                    .then((value) {
                                  print(value);
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(const SnackBar(
                                    content: Text("Prroduct Created."),
                                  ));

                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const WhereUSending()),
                                  );
                                }).catchError((onError) {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(const SnackBar(
                                    content: Text("An Error Happened "),
                                  ));
                                });
                              },
                              child: bookingsController.busyF
                                  ? CircularProgressIndicator()
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
                      SizedBox(
                        height: 50,
                      )
                    ]),
              ),
      ),
    );
  }
}

AppBar appBarCustom(String? title) {
  return AppBar(
    elevation: 0,
    backgroundColor: Colors.white,
    title: Text('$title'),
  );
}
