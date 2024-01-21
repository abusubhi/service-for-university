import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:uni/screens/collages_location.dart';
import 'package:uni/screens/direction.dart';
import 'package:uni/utils/navigations.dart';
import 'package:uni/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class Location extends StatefulWidget {
  LatLng userLocation;
  Location({required this.userLocation, Key? key}) : super(key: key);
  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text("Location"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(
              image: const AssetImage("images/icon.jpg"),
              width: MediaQuery.of(context).size.width * 0.75,
            ),
            const SizedBox(
              height: 12,
            ),
            const CustomText(text: "Going to:"),
            const SizedBox(
              height: 12,
            ),
            MaterialButton(
              color: Theme.of(context).primaryColor,
              shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0)),
              onPressed: () {
                changeScreenReplacement(
                    context,
                    Direction(
                      userLocation: widget.userLocation,
                      endLocation: const LatLng(32.164817, 35.8492488),
                    ));
              },
              child: const Padding(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    "University",
                    style: TextStyle(color: Colors.white),
                  )),
            ),
            const SizedBox(
              height: 12,
            ),
            MaterialButton(
              color: Theme.of(context).primaryColor,
              shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0)),
              onPressed: () => changeScreen(
                  context,
                  CollagesLocation(
                    userLocation: widget.userLocation,
                  )),
              child: const Padding(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    "collage",
                    style: TextStyle(color: Colors.white),
                  )),
            ),
            const SizedBox(
              height: 12,
            ),
            MaterialButton(
              color: Theme.of(context).primaryColor,
              shape: ContinuousRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0)),
              onPressed: () => changeScreen(
                  context,
                  Direction(
                    userLocation: widget.userLocation,
                    endLocation: const LatLng(23, 23),
                  )),
              child: const Padding(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    "Bus Park",
                    style: TextStyle(color: Colors.white),
                  )),
            ),
            const SizedBox(
              height: 12,
            ),
          ],
        ),
      ),
    );
  }
}
