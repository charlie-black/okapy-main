import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:okapy/screens/utils/colors.dart';

class AddCard extends StatefulWidget {
  const AddCard({Key? key}) : super(key: key);

  @override
  State<AddCard> createState() => _AddCardState();
}

class _AddCardState extends State<AddCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Add Card',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10.0, bottom: 1),
            child: SizedBox(
              width: 326,
              child: Text(
                "Card Number",
                style: TextStyle(color: themeColorGrey, fontSize: 12),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: SizedBox(
              width: 326,
              height: 45,
              child: TextFormField(
                decoration: InputDecoration(
                    // border: InputBorder()
                    prefixIcon: Icon(
                  Icons.credit_card_rounded,
                  color: themeColorGreen,
                )),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10, top: 10),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * .45,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10),
                  child: SizedBox(
                    width: 326,
                    height: 45,
                    child: TextFormField(
                      decoration: const InputDecoration(
                        // border: InputBorder()
                        hintText: 'Expiry date',
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * .45,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10),
                  child: SizedBox(
                    width: 326,
                    height: 45,
                    child: TextFormField(
                      decoration: const InputDecoration(
                        // border: InputBorder()
                        hintText: 'Secure code',
                      ),
                    ),
                  ),
                ),
              ),
            ]),
          ),
          Expanded(
            child: Center(
              child: SizedBox(
                  height: 49,
                  width: 326,
                  child: TextButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(themeColorAmber)),
                      onPressed: () {},
                      child: Text(
                        'Add card',
                        style: TextStyle(
                            color: themeColorGreen,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ))),
            ),
          ),
        ],
      ),
    );
  }
}
