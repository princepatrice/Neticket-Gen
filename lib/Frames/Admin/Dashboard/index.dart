import 'package:flutter/material.dart';
import 'package:neticket/Frames/Custom/LocalVideoPlayer.dart';

class DashboardScreen extends StatefulWidget {
  @override
  State<DashboardScreen> createState() => DashboardScreenState();
}

class DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [

      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Statistics',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        StatisticCard(
                          label: 'Accounts',
                          value: '1000',
                          icon: Icons.account_circle_outlined,
                        ),
                        StatisticCard(
                          label: 'Tickets',
                          value: '1000',
                          icon: Icons.airplane_ticket,
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        StatisticCard(
                          label: 'Profiles',
                          value: '500',
                          icon: Icons.verified_user,
                        ),
                        StatisticCard(
                          label: 'Servers',
                          value: '500',
                          icon: Icons.settings_input_component_rounded,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text("Configure Neticket App",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        )),
                  ],
                )),
            Card(
              color: Colors.transparent,
                elevation: 5,
                child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: LocalVideoPlayer(videoPath: 'assets/video/demo.mp4')))
          ],
        ),
      ),
      ]))
    );
  }
}

class StatisticCard extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;

  StatisticCard({required this.label, required this.value, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 20),
        child: Row(children: [
          Padding(
              padding: const EdgeInsets.only(right: 5),
              child: Icon(
                icon,
                size: 40,
                color: Colors.grey,
              )),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                label,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 4),
              Text(
                value,
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ],
          )
        ]),
      ),
    );
  }
}
