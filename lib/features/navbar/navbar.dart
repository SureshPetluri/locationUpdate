import 'package:flutter/material.dart';
import 'package:weather_information/components/button.dart';
import 'package:weather_information/const.dart';
import 'package:weather_information/features/mobileInfo/mobile_info.dart';
import 'package:weather_information/features/otp/otp.dart';
import 'package:weather_information/routes/route_names.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Remove padding
        padding: EdgeInsets.zero,
        children: [
          const UserAccountsDrawerHeader(
            accountEmail: Text(""),
            accountName: Text(""),
          ),
          NavBarItem(
              title: "MobileNumber",
              icon: Icons.phone,
              onPress: () {
                Navigator.pushNamed(context, AppRoutes.mobileInfo);
              }),
          NavBarItem(
              title: "History",
              icon: Icons.history,
              onPress: () {
                Navigator.pushNamed(context, AppRoutes.history);
              }),
          NavBarItem(
              title: "Logout",
              icon: Icons.logout,
              onPress: () {
                _showDialog(context);
              })
        ],
      ),
    );
  }

  _showDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
              const  SizedBox(height: 10,),
                const Text(
                  Constants.logoutWarning,
                  style: TextStyle(fontSize: 16),
                ),
                const  SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    DefaultButton(
                      text: "No",
                      press: () {
                        Navigator.pop(context);
                      },
                    ),
                    DefaultButton(
                      text: "Yes",
                      press: () {
                        Navigator.popUntil(
                            context, ModalRoute.withName(AppRoutes.login));
                      },
                    ),
                  ],
                )
              ],
            ),
          );
        });
  }
}

class NavBarItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function() onPress;

  const NavBarItem(
      {Key? key,
      required this.title,
      required this.icon,
      required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: onPress,
    );
  }
}
