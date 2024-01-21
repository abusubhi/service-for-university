import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:uni/db/collage.dart';
import 'package:uni/screens/add_collage.dart';
import 'package:uni/screens/direction.dart';
import 'package:uni/utils/navigations.dart';
import 'package:uni/widgets/custom_text.dart';
import 'package:uni/widgets/cutom_button.dart';

class CollagesLocation extends StatefulWidget {
  LatLng userLocation;
  // CollagesLocation(this.userLocation);
  CollagesLocation({required this.userLocation, Key? key}) : super(key: key);

  @override
  State<CollagesLocation> createState() => _CollagesLocationState();
}

class _CollagesLocationState extends State<CollagesLocation> {
  List<DocumentSnapshot> collages = <DocumentSnapshot>[];
  CollageServices collageServices = CollageServices();

  @override
  void initState() {
    _get();
    super.initState();
  }

  _get() async {
    List<DocumentSnapshot> d = await collageServices.getCollages();

    setState(() {
      collages = d;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text("Collages Location"),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){
            changeScreen(context, const AddCollage());
          }, icon: const Icon(Icons.add))
        ],
      ),
      body: ListView.builder(
        itemCount: collages.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
                child: ListTile(
              onTap: () => changeScreen(
                  context,
                  Direction(
                      userLocation: widget.userLocation,
                      endLocation: LatLng(
                          collages[index]['long'], collages[index]['lat']))),
              title: Image(
                image: NetworkImage(collages[index]['image']),
                height: MediaQuery.of(context).size.width * 0.5,
              ),
              leading: CustomText(text: collages[index]['name']),
            )),
          );
        },
      ),
      // ListView(
      //   children: [
      //     Padding(
      //       padding: const EdgeInsets.all(8.0),
      //       child: Card(
      //           child: ListTile(
      //         onTap: () => changeScreen(
      //             context,
      //             Direction(
      //                 userLocation: userLocation,
      //                 endLocation: LatLng(32.1647025, 35.8526347))),
      //         title: Image(
      //           image: AssetImage("images/pharmacy.jfif"),
      //           height: MediaQuery.of(context).size.width * 0.5,
      //         ),
      //         leading: CustomText(text: "Pharmacy"),
      //       )),
      //     ),
      //     Padding(
      //       padding: const EdgeInsets.all(8.0),
      //       child: Card(
      //           child: ListTile(
      //         onTap: () => changeScreen(
      //             context,
      //             Direction(
      //                 userLocation: userLocation,
      //                 endLocation: LatLng(32.1648125, 35.8536262))),
      //         title: Image(
      //           image: AssetImage("images/engineering.jfif"),
      //           height: MediaQuery.of(context).size.width * 0.5,
      //         ),
      //         leading: CustomText(text: "Engineering"),
      //       )),
      //     ),
      //     Padding(
      //       padding: const EdgeInsets.all(8.0),
      //       child: Card(
      //           child: ListTile(
      //         onTap: () => changeScreen(
      //             context,
      //             Direction(
      //                 userLocation: userLocation,
      //                 endLocation: LatLng(32.1648125, 35.8536262))),
      //         title: Image(
      //           image: AssetImage("images/it.jfif"),
      //           height: MediaQuery.of(context).size.width * 0.5,
      //         ),
      //         leading: CustomText(text: "IT"),
      //       )),
      //     ),
      //     Padding(
      //       padding: const EdgeInsets.all(8.0),
      //       child: Card(
      //           child: ListTile(
      //         onTap: () => changeScreen(
      //             context,
      //             Direction(
      //                 userLocation: userLocation,
      //                 endLocation: LatLng(32.1648125, 35.8536262))),
      //         title: Image(
      //           image: AssetImage("images/nursing.jfif"),
      //           height: MediaQuery.of(context).size.width * 0.5,
      //         ),
      //         leading: CustomText(text: "Nursing"),
      //       )),
      //     ),
      //     Padding(
      //       padding: const EdgeInsets.all(8.0),
      //       child: Card(
      //           child: ListTile(
      //         onTap: () => changeScreen(
      //             context,
      //             Direction(
      //                 userLocation: userLocation,
      //                 endLocation: LatLng(32.1648125, 35.8536262))),
      //         title: Image(
      //           image: AssetImage("images/lawy.jfif"),
      //           height: MediaQuery.of(context).size.width * 0.5,
      //         ),
      //         leading: CustomText(text: "Law"),
      //       )),
      //     ),

      //     // CustomButton(
      //     //   text: "Pharmacy",
      //     //   onPress: () => changeScreen(
      //     //       context,
      //     //       Direction(
      //     //           userLocation: userLocation,
      //     //           destLocation: LatLng(35.68, 51.41))),
      //     // ),
      //     // CustomButton(
      //     //     text: "Engineering",
      //     //     onPress: () => changeScreen(
      //     //         context,
      //     //         Direction(
      //     //             userLocation: userLocation,
      //     //             destLocation: LatLng(35.68, 51.41)))),
      //     // CustomButton(
      //     //     text: "IT",
      //     //     onPress: () => changeScreen(
      //     //         context,
      //     //         Direction(
      //     //             userLocation: userLocation,
      //     //             destLocation: LatLng(35.68, 51.41)))),
      //     // CustomButton(
      //     //     text: "Nursing",
      //     //     onPress: () => changeScreen(
      //     //         context,
      //     //         Direction(
      //     //             userLocation: userLocation,
      //     //             destLocation: LatLng(35.68, 51.41)))),
      //     // CustomButton(
      //     //     text: "Science",
      //     //     onPress: () => changeScreen(
      //     //         context,
      //     //         Direction(
      //     //             userLocation: userLocation,
      //     //             destLocation: LatLng(35.68, 51.41)))),
      //     // CustomButton(
      //     //     text: "Languages",
      //     //     onPress: () => changeScreen(
      //     //         context,
      //     //         Direction(
      //     //             userLocation: userLocation,
      //     //             destLocation: LatLng(35.68, 51.41)))),
      //   ],
      // ),
    );
  }
}
