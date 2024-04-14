import 'package:flutter/material.dart';
import 'package:jetmaps/Control_Room.dart'; // Import your home page file

class ControlRoomPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Control Room'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: InkWell(
          onTap: () {}, // Add an empty onTap handler to InkWell to make it clickable
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Issues',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16.0),
              Table(
                border: TableBorder.all(),
                columnWidths: {
                  0: FlexColumnWidth(),
                  1: FlexColumnWidth(),
                  2: FlexColumnWidth(),
                  3: FlexColumnWidth(),
                  4: FlexColumnWidth(),
                },
                children: [
                  TableRow(
                    children: [
                      InkWell(
                        onTap: () {
                          _navigateToIssueDetails(context, '1', '2024-04-12 09:00:00', '40.7128° N', '74.0060° W', 'Pending');
                        },
                        child: TableCell(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('1'),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          _navigateToIssueDetails(context, '1', '2024-04-12 09:00:00', '40.7128° N', '74.0060° W', 'Pending');
                        },
                        child: TableCell(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('2024-04-12 09:00:00'),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          _navigateToIssueDetails(context, '1', '2024-04-12 09:00:00', '40.7128° N', '74.0060° W', 'Pending');
                        },
                        child: TableCell(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('40.7128° N'),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          _navigateToIssueDetails(context, '1', '2024-04-12 09:00:00', '40.7128° N', '74.0060° W', 'Pending');
                        },
                        child: TableCell(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('74.0060° W'),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          _navigateToIssueDetails(context, '1', '2024-04-12 09:00:00', '40.7128° N', '74.0060° W', 'Pending');
                        },
                        child: TableCell(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('Pending'),
                          ),
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      InkWell(
                        onTap: () {
                          _navigateToIssueDetails(context, '2', '2024-04-12 10:30:00', '34.0522° N', '118.2437° W', 'Resolved');
                        },
                        child: TableCell(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('2'),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          _navigateToIssueDetails(context, '2', '2024-04-12 10:30:00', '34.0522° N', '118.2437° W', 'Resolved');
                        },
                        child: TableCell(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('2024-04-12 10:30:00'),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          _navigateToIssueDetails(context, '2', '2024-04-12 10:30:00', '34.0522° N', '118.2437° W', 'Resolved');
                        },
                        child: TableCell(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('34.0522° N'),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          _navigateToIssueDetails(context, '2', '2024-04-12 10:30:00', '34.0522° N', '118.2437° W', 'Resolved');
                        },
                        child: TableCell(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('118.2437° W'),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          _navigateToIssueDetails(context, '2', '2024-04-12 10:30:00', '34.0522° N', '118.2437° W', 'Resolved');
                        },
                        child: TableCell(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('Resolved'),
                          ),
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      InkWell(
                        onTap: () {
                          _navigateToIssueDetails(context, '3', '2024-04-12 12:45:00', '51.5074° N', '0.1278° W', 'Pending');
                        },
                        child: TableCell(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('3'),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          _navigateToIssueDetails(context, '3', '2024-04-12 12:45:00', '51.5074° N', '0.1278° W', 'Pending');
                        },
                        child: TableCell(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('2024-04-12 12:45:00'),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          _navigateToIssueDetails(context, '3', '2024-04-12 12:45:00', '51.5074° N', '0.1278° W', 'Pending');
                        },
                        child: TableCell(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('51.5074° N'),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          _navigateToIssueDetails(context, '3', '2024-04-12 12:45:00', '51.5074° N', '0.1278° W', 'Pending');
                        },
                        child: TableCell(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('0.1278° W'),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          _navigateToIssueDetails(context, '3', '2024-04-12 12:45:00', '51.5074° N', '0.1278° W', 'Pending');
                        },
                        child: TableCell(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('Pending'),
                          ),
                        ),
                      ),
                    ],
                  ),
                  // Add TableRow for other issues similarly
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _navigateToIssueDetails(BuildContext context, String issueId, String time, String lat, String lng, String status) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HomePage(
          issueId: issueId,
          time: time,
          lat: lat,
          lng: lng,
          status: status,
        ),
      ),
    );
  }
}
