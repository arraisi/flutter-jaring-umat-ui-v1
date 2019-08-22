import 'package:flutter/material.dart';
import '../../style.dart';
import '../../custome_icon/navigation_icon_icons.dart';
import '../../custome_icon/social_media_icon_icons.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController nomorTeleponCtrl = new TextEditingController();
  bool nomorTeleponIsSubmited = false;

  void nomorTeleponSubmit() {
    setState(() {
      if (!nomorTeleponCtrl.text.isEmpty) {
        nomorTeleponIsSubmited = true;
      } else {
        nomorTeleponIsSubmited = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
                padding: EdgeInsets.only(top: 120),
                child: Center(
                  child: Image.asset(
                    'assets/logo/logo_size_4X.png',
                    width: 150,
                  ),
                )),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: Center(
                  child: Text(
                "Jaring Umat",
                style: headingStyle,
              )),
            ),
            Padding(
              padding: EdgeInsets.only(top: 50, bottom: 10),
              child: Center(
                  child: Text(
                "Masukan nomor telepon",
                style: headphoneDescStyle,
              )),
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
                      controller: nomorTeleponCtrl,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixText: "+62 ",
                          hintText: "Nomor Telepon",
                          hintStyle: headphoneDescStyle,
                          prefixIcon: Icon(Icons.phone_android),
                          suffixIcon: CircleIconButton(
                            onPressed: () {
                              if (nomorTeleponIsSubmited) Navigator.of(context).pushNamed('/login/otp');
                            },
                            textFieldSubmitted: nomorTeleponIsSubmited,
                          )),
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.go,
                      onChanged: (value) {
                        nomorTeleponSubmit();
                      },
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 45, bottom: 10),
              child: Center(
                  child: Text(
                "atau buat akun dengan media social",
                style: headphoneDescStyle,
              )),
            ),
            Center(
              child: Container(
                height: 75,
                width: 170,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    IconButton(
                      padding: EdgeInsets.all(0),
                      icon: Icon(
                        SocialMediaIcon.facebook,
                        color: Colors.blue[700],
                      ),
                      iconSize: 50,
                    ),
                    IconButton(
                      padding: EdgeInsets.all(0),
                      icon: Icon(
                        SocialMediaIcon.google,
                        color: Colors.red[700],
                      ),
                      iconSize: 50,
                    ),
                    IconButton(
                      padding: EdgeInsets.all(0),
                      icon: Icon(
                        SocialMediaIcon.linkedin,
                        color: Colors.lightBlue[700],
                      ),
                      iconSize: 50,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Image.asset(
        "assets/logo/accent_app_width_full_screen.png",
        fit: BoxFit.fitWidth,
        alignment: Alignment.bottomLeft,
      ),
    );
  }
}

class CircleIconButton extends StatelessWidget {
  final double size;
  final Function onPressed;
  final IconData icon;
  bool textFieldSubmitted;

  CircleIconButton({this.size = 40.0, this.icon = NavigationIcon.next, this.onPressed, this.textFieldSubmitted});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: this.onPressed,
        icon: SizedBox(
            width: size,
            height: size,
            child: Stack(
              alignment: Alignment(0.0, 0.0), // all centered
              children: <Widget>[
                Container(
                  width: size,
                  height: size,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: textFieldSubmitted ? Colors.green : Colors.grey[400]),
                ),
                Icon(
                  icon,
                  size: size * 0.3, // 60% width for icon
                  color: textFieldSubmitted ? Colors.white : Colors.grey,
                )
              ],
            )));
  }
}
