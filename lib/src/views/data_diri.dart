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
          padding: const EdgeInsets.all(12.0),
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
          style: TextStyle(fontSize: 22, fontFamily: 'sofiapro-bold', color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/logo/accent_app_width_full_screen.png"),
              fit: BoxFit.fitWidth,
              alignment: Alignment.bottomCenter),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Lengkapi Akunmu!",
                  style: headingStyle,
                ),
                SizedBox(height: 10),
                Text(
                  "Unggah foto diri dan lengkapi namad Anda\nuntuk mulai berbagi kebaikan!",
                  textAlign: TextAlign.center,
                  style: searchBarStyle,
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 30),
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
                Container(
                  height: 35,
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
                  height: 35,
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
        ),
      ),
    );
  }

  // DIALOG
  dialogContent(BuildContext context) {
    return Container(
        height: 450,
        width: double.infinity,
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 10,
              right: 10,
              child: Container(
                height: 25,
                width: 25,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(100), color: Colors.green),
                child: IconButton(
                  alignment: Alignment.center,
                    icon: Icon(
                      NavigationIcon.close,
                      color: Colors.white,
                      size: 10,
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
                    padding: const EdgeInsets.only(top: 30),
                    child: Icon(
                      EmptyPicture.empty_picture,
                      size: 90,
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
                    margin: EdgeInsets.symmetric(horizontal: 10),
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
                    margin: EdgeInsets.symmetric(horizontal: 10),
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
                    width: 195,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Stack(
                          alignment: Alignment.bottomRight,
                          children: <Widget>[
                            Image.asset(
                              'assets/images/default_picture_man.png',
                              width: 90,
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
                              width: 90,
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
                  Container(
                    height: 40,
                    width: 180,
                    child: FlatButton(
                      onPressed: () {
                        Navigator.pop(context, null);
                      },
                      color: Colors.green,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(45)),
                      child: Text(
                        "Unggah",
                        style: TextStyle(fontFamily: 'sofiapro-bold', fontSize: 18, color: Colors.white),
                      ),
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
      size: 120,
      color: Colors.grey,
    );
  }

  Widget defaultPicture() {
    return Image.asset(
      _selectedDefaultPicture,
      width: 120,
    );
  }

  Widget selectedImage() {
    return Container(
        width: 120,
        height: 120,
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
