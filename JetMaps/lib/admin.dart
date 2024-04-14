import 'package:flutter/material.dart';
import 'package:jetmaps/Control_Room2.dart';
import 'package:url_launcher/url_launcher.dart';

class adminPage extends StatelessWidget {
  const adminPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Dashboard'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                _launchURL('https://dapoxjamfist.itch.io/jetmaps-live');
              },
              child: Text('Admin Dashboard Live'),
            ),
            SizedBox(height: 20), // Add some space between the buttons
            ElevatedButton(
              onPressed: () {
                _launchURL('https://dapoxjamfist.itch.io/jetmaps-forecast');
              },
              child: Text('Admin Dashboard Forecast'),
            ),
            SizedBox(height: 20), // Add some space between the buttons
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ControlRoomPage()),
                );
              },
              child: Text('Control Room'),
            ),
          ],
        ),
      ),
    );
  }

  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
