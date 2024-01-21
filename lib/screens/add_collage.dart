import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uni/db/collage.dart';
import 'package:uni/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

class AddCollage extends StatefulWidget {
  const AddCollage({Key? key}) : super(key: key);

  @override
  State<AddCollage> createState() => _AddCollageState();
}

class _AddCollageState extends State<AddCollage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  CollageServices collageServices = CollageServices();

  String? name, long, lat;
  // var image;
  TextEditingController? nameController,
      longController,
      latController = TextEditingController();

  var image;
  void imagem() async {
    PickedFile? picked =
        await ImagePicker().getImage(source: ImageSource.gallery);
    setState(() {
      image = File(picked!.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text("Add Collage"),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            const SizedBox(
              height: 60,
            ),
            Image(
              image: const AssetImage("images/icon.jpg"),
              width: MediaQuery.of(context).size.width * 0.75,
            ),
            Column(
              children: [
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 120,
                      child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(
                                color: Colors.grey.withOpacity(0.5),
                                width: 2.5),
                          ),
                          onPressed: imagem,
                          child: image == null
                              ? const Padding(
                                  padding:
                                      EdgeInsets.fromLTRB(14, 50, 14, 50),
                                  child: Icon(
                                    Icons.add,
                                    color: Colors.grey,
                                  ),
                                )
                              : Image.file(image)),
                    ),
                  ),
                ),
              ],
            ),
            CustomTextField(
                hintText: "Collage Name",
                controller: nameController,
                icon: Icons.location_city,
                align: TextAlign.start,
                onChanged: (String value) {
                  name = value.trim();
                }),
            const SizedBox(
              height: 12,
            ),
            CustomTextField(
                hintText: "Long",
                controller: longController,
                icon: Icons.add_location,
                align: TextAlign.start,
                onChanged: (String value) {
                  long = value;
                }),
            const SizedBox(
              height: 12,
            ),
            CustomTextField(
                hintText: "Lat",
                controller: latController,
                icon: Icons.add_location,
                align: TextAlign.start,
                onChanged: (String value) {
                  lat = value;
                }),
            const SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: MaterialButton(
                color: Theme.of(context).primaryColor,
                shape: ContinuousRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0)),
                onPressed: () async {
                  if (image != null) {
                    String imageUrl1;
                    FirebaseStorage storage = FirebaseStorage.instance;
                    Reference ref = storage
                        .ref()
                        .child("image1${DateTime.now()}");
                    UploadTask uploadTask = ref.putFile(image);
                    uploadTask.then((res) async {
                      imageUrl1 = await res.ref.getDownloadURL().then((url) {
                        return url;
                      });
                      if (_formKey.currentState!.validate()) {
                        collageServices.addCollage({
                          'name': name,
                          'image': imageUrl1,
                          'long': double.parse(long!),
                          'lat': double.parse(lat!)
                        }).then((value) {
                          var snackBar = const SnackBar(
                              content: Text("Added Successfully"));
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          _formKey.currentState!.reset();
                        });
                      }
                    });
                  } else {
                    var snackBar =
                        const SnackBar(content: Text("Please add image"));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                },
                child: const Padding(
                    padding: EdgeInsets.all(8),
                    child: Text(
                      "Add",
                      style: TextStyle(color: Colors.white),
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
