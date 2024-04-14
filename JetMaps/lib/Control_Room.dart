import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final String issueId;
  final String time;
  final String lat;
  final String lng;
  final String status;

  const HomePage({
    Key? key,
    required this.issueId,
    required this.time,
    required this.lat,
    required this.lng,
    required this.status,
  }) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _textController = TextEditingController();
  String _message = ''; // Variable to hold the message

  void _showTreeFallAlert() {
    setState(() {
      _message = 'Tree fall detected! Please be careful.';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            // Display issue details
            ListTile(
              title: Text('Issue ID: ${widget.issueId}'),
              subtitle: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Time: ${widget.time} '),
                  Text('Latitude: ${widget.lat} '),
                  Text('Longitude: ${widget.lng} '),
                  Text('Status: ${widget.status}'),
                ],
              ),
            ),
            Divider(), // Add a divider below the issue details
            TextField(
              controller: _textController,
              decoration: InputDecoration(
                hintText: 'image url',
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  onPressed: () {
                    _textController.clear();
                  },
                  icon: const Icon(Icons.clear),
                ),
              ),
            ),
            SizedBox(height: 20), // Add some space between TextField and Button
            ElevatedButton(
              onPressed: () {
                _showTreeFallAlert(); // Call the function to show message
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                textStyle: MaterialStateProperty.all<TextStyle>(
                  TextStyle(color: Colors.white), // Set text color to white
                ),
              ),
              child: Text('Upload'),
            ),
            SizedBox(height: 20), // Add some space between Button and Text
            Text(
              _message,
              style: TextStyle(
                color: Colors.red, // Adjust color as needed
                fontSize: 16, // Adjust font size as needed
              ),
            ),
            SizedBox(height: 20), // Add some space below Text
            ElevatedButton(
              onPressed: () {
                // Add functionality to report admin
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                textStyle: MaterialStateProperty.all<TextStyle>(
                  TextStyle(color: Colors.white), // Set text color to white
                ),
              ),
              child: Text('Report Admin'),
            ),
          ],
        ),
      ),
    );
  }
}
