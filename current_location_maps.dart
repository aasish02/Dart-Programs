import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:geolocator/geolocator.dart';

void main() {
  runApp(MaterialApp(
    title: "Maps",
    home: Maps(),
  ));
}

class Maps extends StatefulWidget {
  const Maps({super.key});

  @override
  State<Maps> createState() => _MapsState();
}

class _MapsState extends State<Maps> {
  String locationMessage = '';
  final TextEditingController sourceCtr = TextEditingController();
  final TextEditingController hotelNameCtr = TextEditingController();

  @override
  void initState() {
    super.initState();
    getCurrentLocation();
  }

  Future<void> getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    setState(() {
      locationMessage = "Latitude : ${position.latitude}, Longitude : ${position.longitude}";
    });
  }

  Future<void> openDirection() async {
    final String source = Uri.encodeComponent(sourceCtr.text);
    final String hotelName = Uri.encodeComponent(hotelNameCtr.text);
    final String url = 'https://www.google.com/maps/dir/?api=1&origin=$source&destination=$hotelName';
    await launchUrl(url);
  }

  Future<void> launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Could not launch Google Maps.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Maps'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          children: [
            Text(locationMessage),
            // for map
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TextField(
                    controller: sourceCtr,
                    decoration: InputDecoration(labelText: 'Source'),
                  ),
                  TextField(
                    controller: hotelNameCtr,
                    decoration: InputDecoration(labelText: 'Hotel Name'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      openDirection();
                    },
                    child: Text('OK'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
