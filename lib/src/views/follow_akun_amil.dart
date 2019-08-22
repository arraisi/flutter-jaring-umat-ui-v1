import 'package:flutter/material.dart';
import '../../custome_icon/navigation_icon_icons.dart';
import '../../style.dart';
import '../model/model.dart';
import 'widgets/akun_card.dart';

class FollowAkun extends StatefulWidget {
  @override
  _FollowAkunState createState() => _FollowAkunState();
}

class _FollowAkunState extends State<FollowAkun> {
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
                  Navigator.of(context).pushNamed('/login/data-diri');
                },
              )),
        ),
        elevation: 0,
        title: Text(
          "Follow Akun Amil",
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
            SizedBox(height: 50),
            Text(
              "Mulai Beramal Sekarang!",
              style: subHeadingStyle,
            ),
            SizedBox(height: 10),
            Text(
              "Follow akun Amil terpopuler dibawah ini dan mulai berpartisipasi pada galang amal mereka.",
              textAlign: TextAlign.center,
              style: headphoneDescStyle,
            ),
            SizedBox(height: 30),
            Container(
              height: 275,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: akunAmils.length,
                  itemBuilder: (context, index) {
                    var amil = akunAmils[index];
                    return AkunCard(
                      imgUrl: amil.image,
                      title: amil.title,
                      aksiGalangAmal: amil.aksiGalangAmal,
                      bintang: amil.bintang,
                      pengikut: amil.pengikut,
                    );
                  }),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: FlatButton(
                onPressed: () {},
                child: Text(
                  "Lihat Semua",
                  style: TextStyle(fontSize: 18, fontFamily: 'sofiapro-bold', color: Colors.blue),
                ),
              ),
            ),
            SizedBox(
              width: 310,
              height: 45,
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
}
