import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:okapy/screens/createbooking/createbooking.dart';
import 'package:okapy/screens/utils/colors.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarCustom('Notifications'),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Row(
            children: const [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  'Today',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
          ListTile(
            leading: Icon(
              Icons.notifications,
              color: themeColorAmber,
            ),
            title: Text('Package successfully paid'),
            trailing: Text(
              '10 min ago',
              style: TextStyle(color: themeColorGrey, fontSize: 10),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.notifications,
              color: themeColorAmber,
            ),
            title: Text('Your driver has arrived '),
            trailing: Text(
              '10 min ago',
              style: TextStyle(color: themeColorGrey, fontSize: 10),
            ),
          ),
          Row(
            children: const [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  'This week',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
          ListTile(
            leading: Icon(
              Icons.notifications_none_outlined,
              color: themeColorAmber,
            ),
            title: const Text('Your driver has arrived '),
            trailing: Text(
              '10 min ago',
              style: TextStyle(color: themeColorGrey, fontSize: 10),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.notifications_none_outlined,
              color: themeColorAmber,
            ),
            title: const Text('Your driver has arrived '),
            trailing: Text(
              '10 min ago',
              style: TextStyle(color: themeColorGrey, fontSize: 10),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.notifications_none_outlined,
              color: themeColorAmber,
            ),
            title: const Text('Your driver has arrived '),
            trailing: Text(
              '10 min ago',
              style: TextStyle(color: themeColorGrey, fontSize: 10),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.notifications_none_outlined,
              color: themeColorAmber,
            ),
            title: const Text('Your driver has arrived '),
            trailing: Text(
              '10 min ago',
              style: TextStyle(color: themeColorGrey, fontSize: 10),
            ),
          ),
        ],
      ),
    );
  }
}
