import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:okapy/screens/utils/colors.dart';

class Chat extends StatefulWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Colors.,
        appBar: AppBar(
          backgroundColor: Colors.white,
          shadowColor: Colors.transparent,
          title: Text(
            'Muhu Njenga',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.phone_outlined,
                color: themeColorAmber,
              ),
            )
          ],
        ),
        body: Column(
          children: [
            Expanded(
                child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Wed, Aug 24 ,3:58PM',
                    style: TextStyle(fontSize: 12, color: themeColorGrey),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .7,
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Keep your account safe by avoiding to give out any personal information to the drivers. Okapy will never ask you for your credit information or PIN',
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xff4F4F4F),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                const Divider(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 15.0),
                      child: Container(
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10)),
                            color: Color.fromRGBO(239, 175, 29, .36)),
                        width: MediaQuery.of(context).size.width * .5,
                        padding: EdgeInsets.all(10),
                        child: Text('Hey , How far are you ?Thanks '),
                      ),
                    )
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(right: 15.0, top: 5),
                        child: Text(
                          '3:55 PM ',
                          style: TextStyle(fontSize: 12, color: themeColorGrey),
                        ))
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Container(
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(10),
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10)),
                            color: Color.fromRGBO(238, 238, 238, 1)),
                        width: MediaQuery.of(context).size.width * .5,
                        padding: const EdgeInsets.all(10),
                        child: const Text('Just around the corner  '),
                      ),
                    )
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(left: 15.0, top: 5),
                        child: Text(
                          '3:55 PM ',
                          style: TextStyle(fontSize: 12, color: themeColorGrey),
                        ))
                  ],
                )
              ],
            )),
            Container(
              color: Colors.white,
              child: Form(
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 70,
                        width: MediaQuery.of(context).size.width * .6,
                        child: TextFormField(
                          validator: (value) {
                            return null;
                          },
                          maxLines: 6,
                        ),
                      ),
                      Container(
                        height: 49,
                        width: 106,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xffEFAF1D)),
                        child: ElevatedButton(
                            onPressed: () {}, child: const Text('send')),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
