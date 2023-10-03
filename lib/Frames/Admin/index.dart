import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:neticket/Frames/Admin/Dashboard/index.dart';
import 'package:neticket/Frames/Admin/Hospot/index.dart';
import 'package:neticket/Frames/Admin/Profiles/index.dart';
import 'package:neticket/Frames/Admin/Settings/index.dart';
import 'package:neticket/Frames/Admin/Tickets/index.dart';
import 'package:neticket/Frames/Home/index.dart';
import 'package:neticket/Frames/Schemas/router.dart';

class AdminScreen extends StatefulWidget {
  final NRouter router;
  const AdminScreen({super.key, required this.router});
  @override
  State<AdminScreen> createState() => AdminScreenState();
}

enum Screen { Dashboard, Hostpot, Profiles, Tickets, Settings }

class AdminScreenState extends State<AdminScreen> {
  final Map<Screen, Widget> MenuPages = {
    Screen.Dashboard: DashboardScreen(),
    Screen.Hostpot: HospotScreen(),
    Screen.Profiles: ProfilesScreen(),
    Screen.Tickets: TicketsScreen(),
    Screen.Settings: SettingsScreen()
  };

  Screen currentScreenIndex = Screen.Dashboard;

  @override
  initState() {
    super.initState();
  }

  void changeScreen(Screen newScreen) {
    setState(() {
      currentScreenIndex = newScreen;
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
            title: const Text(
          "Admin",
          style: TextStyle(fontWeight: FontWeight.bold),
        )),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.orange,
                ),
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Image.asset('assets/logo/ico.png',
                        width: 150.0, height: 100.0),
                  ),
                  Text(
                    widget.router.name,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  )
                ]),
              ),
              MenuItem(Icons.dashboard, "Dashboard",
                  () => {changeScreen(Screen.Dashboard)}),
              MenuItem(Icons.verified_user_rounded, "Profile",
                  () => {changeScreen(Screen.Profiles)}),
              MenuItem(Icons.account_circle_outlined, "Hospots",
                  () => {changeScreen(Screen.Hostpot)}),
              MenuItem(Icons.airplane_ticket, "Tickets",
                  () => {changeScreen(Screen.Tickets)}),
              MenuItem(Icons.settings, "Settings",
                  () => {changeScreen(Screen.Settings)}),
              MenuItem(
                  Icons.router,
                  "Switch Router",
                  () => {
                        Navigator.pop(context),
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeScreen()))
                      })
              // Add more items as needed
            ],
          ),
        ),
        body: MenuPages[currentScreenIndex]);
  }

  Widget MenuItem(IconData icon, String text, Function action) {
    return Column(children: [
      const SizedBox(height: 10),
      ListTile(
        onTap: () => {action()},
        leading: CircleAvatar(
          backgroundColor: Colors.orange, // Use any default color you prefer
          child: Icon(icon), // Use any default icon you prefer
        ),
        title: Text(
          text,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      const SizedBox(height: 10)
    ]);
    ;
  }
}
