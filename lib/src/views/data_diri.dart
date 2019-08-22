import 'package:flutter/material.dart';
import '../../custome_icon/navigation_icon_icons.dart';
import '../../custome_icon/empty_picture_icons.dart';
import '../../style.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class DataDiri extends StatefulWidget {
  @override
  _DataDiri createState() => _DataDiri();
}

class _DataDiri extends State<DataDiri> {
  File _selectedImage;
  String _selectedDefaultPicture = "";
  bool defaultPictureMan = false;
  bool defaultPictureWoman = false;

  void defaultPictureSelected(value) {
    setState(() {
      if (value == 'assets/images/default_picture_man.png') {
        defaultPictureWoman = false;
        defaultPictureMan = !defaultPictureMan;
        defaultPictureMan ? _selectedDefaultPicture = value : _selectedDefaultPicture = "";
      } else {
        defaultPictureMan = false;
        defaultPictureWoman = !defaultPictureWoman;
        defaultPictureMan ? _selectedDefaultPicture = value : _selectedDefaultPicture = "";
      }
    });
  }

  Future<ImageSource> _asyncImageSourceDialog(BuildContext context) async {
    return await showDialog<ImageSource>(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
            elevation: 0.0,
            backgroundColor: Colors.transparent,
            child: dialogContent(context),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
              decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.circular(100)),
              child: IconButton(
                icon: Icon(
                  NavigationIcon.back,
                  color: Colors.white,
                  size: 15,
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed('/login');
                },
              )),
        ),
        elevation: 0,
        title: Text(
          "Data Diri",
          style: TextStyle(fontSize: 26, fontFamily: 'sofiapro-bold', color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 30, bottom: 10),
              child: Text(
                "Lengkapi Akunmu!",
                style: headingStyle,
              ),
            ),
            Text(
              "Unggah foto diri dan lengkapi namad Anda\nuntuk mulai berbagi kebaikan!",
              textAlign: TextAlign.center,
              style: searchBarStyle,
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Container(
                height: 175,
                width: double.infinity,
                child: Align(
                  alignment: Alignment.center,
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: <Widget>[
                      _selectedImage == null
                          ? _selectedDefaultPicture.isEmpty ? emptyPicture() : defaultPicture()
                          : selectedImage(),
                      GestureDetector(
                        onTap: () async {
                          print(context);
                          final ImageSource imageSource = await _asyncImageSourceDialog(context);
                        },
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(color: Colors.green, shape: BoxShape.circle),
                          child: Icon(
                            NavigationIcon.upload,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              height: 40,
              margin: EdgeInsets.symmetric(horizontal: 50),
              decoration: BoxDecoration(color: Colors.grey.withOpacity(.22), borderRadius: BorderRadius.circular(30)),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 18, right: 5),
                  child: Container(
                    child: TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Nama Lengkap",
                          hintStyle: headphoneDescStyle,
                          helperStyle: searchBarStyle),
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.go,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              height: 40,
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 50),
              decoration: BoxDecoration(color: Colors.amber, borderRadius: BorderRadius.circular(45)),
              child: FlatButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/login/follow-akun');
                },
                child: Text(
                  "Selanjutanya",
                  style: TextStyle(fontFamily: 'sofiapro-bold', fontSize: 18, color: Colors.white),
                ),
                color: Colors.green,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(45)),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Image.asset('assets/logo/accent_app_width_full_screen.png'),
    );
  }

  // DIALOG
  dialogContent(BuildContext context) {
    return Container(
        height: 500,
        width: 400,
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(30)),
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 22,
              right: 22,
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(100), color: Colors.green),
                child: IconButton(
                    icon: Icon(
                      NavigationIcon.close,
                      color: Colors.white,
                      size: 20,
                    ),
                    onPressed: () {
                      Navigator.pop(context, null);
                    }),
              ),
            ),
            Container(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Icon(
                      EmptyPicture.empty_picture,
                      size: 95,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SimpleDialogOption(
                    onPressed: () {
                      Navigator.of(context).pop(ImageSource.gallery);
                      var image = ImagePicker.pickImage(source: ImageSource.gallery);
                      setState(() {
                        _selectedImage = image as File;
                      });
                    },
                    child: const Text('Unggah foto dari galeri',
                        style: TextStyle(fontSize: 20, fontFamily: 'sofiapro-bold', color: Colors.blueAccent)),
                  ),
                  Container(
                    height: 3.5,
                    width: 265,
                    color: Colors.grey[200],
                  ),
                  SimpleDialogOption(
                    onPressed: () {
                      Navigator.of(context).pop(ImageSource.camera);
                    },
                    child: const Text('Ambil foto dari kamera',
                        style: TextStyle(fontSize: 20, fontFamily: 'sofiapro-bold', color: Colors.blueAccent)),
                  ),
                  Container(
                    height: 3.5,
                    width: 265,
                    color: Colors.grey[200],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 15),
                    child: Text(
                      "Pilih Foto Default",
                      style: searchBarStyle,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: 210,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Stack(
                          alignment: Alignment.bottomRight,
                          children: <Widget>[
                            Image.asset(
                              'assets/images/default_picture_man.png',
                              width: 95,
                            ),
                            GestureDetector(
                              onTap: () {
                                defaultPictureSelected('assets/images/default_picture_man.png');
                              },
                              child: Container(
                                height: 35,
                                width: 35,
                                decoration: BoxDecoration(
                                    color: defaultPictureMan ? Colors.green : Colors.grey[300],
                                    borderRadius: BorderRadius.circular(100)),
                                child: Icon(
                                  NavigationIcon.check,
                                  size: 20,
                                  color: defaultPictureMan ? Colors.white : Colors.grey,
                                ),
                              ),
                            )
                          ],
                        ),
                        Stack(
                          alignment: Alignment.bottomRight,
                          children: <Widget>[
                            Image.asset(
                              'assets/images/default_picture_woman.png',
                              width: 95,
                            ),
                            GestureDetector(
                              onTap: () {
                                defaultPictureSelected('assets/images/default_picture_woman.png');
                              },
                              child: Container(
                                height: 35,
                                width: 35,
                                decoration: BoxDecoration(
                                    color: defaultPictureWoman ? Colors.green : Colors.grey[300],
                                    borderRadius: BorderRadius.circular(100)),
                                child: Icon(
                                  NavigationIcon.check,
                                  size: 20,
                                  color: defaultPictureWoman ? Colors.white : Colors.grey,
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 270,
                    height: 45,
                    child: FlatButton(
                      onPressed: () {
                        Navigator.pop(context, null);
                      },
                      child: Text(
                        "Unggah",
                        style: TextStyle(fontFamily: 'sofiapro-bold', fontSize: 18, color: Colors.white),
                      ),
                      color: Colors.green,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(45)),
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }

  Widget emptyPicture() {
    return Icon(
      EmptyPicture.empty_picture,
      size: 130,
      color: Colors.grey,
    );
  }

  Widget defaultPicture() {
    return Image.asset(
      _selectedDefaultPicture,
      width: 130,
    );
  }

  Widget selectedImage() {
    return Container(
        width: 130,
        height: 130,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white.withOpacity(0.5),
          image: DecorationImage(
            image: FileImage(_selectedImage),
            fit: BoxFit.cover,
          ),
        ));
  }
}
