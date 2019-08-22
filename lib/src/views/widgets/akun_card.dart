import 'package:flutter/material.dart';

class AkunCard extends StatelessWidget {
  final String imgUrl;
  final String title;
  final int bintang;
  final int pengikut;
  final int aksiGalangAmal;

  AkunCard({this.imgUrl, this.title, this.bintang, this.pengikut, this.aksiGalangAmal});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Container(
        width: 165,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: new Border.all(color: Colors.grey[200], width: 5)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 5),
              child: Image.asset(
                imgUrl,
                width: 85,
              ),
            ),
            Text(
              title,
              style: TextStyle(fontFamily: 'sofiapro-bold', fontSize: 18),
            ),
            SizedBox(
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.star, size: 20, color: Colors.amber,),
                  Icon(Icons.star, size: 20, color: Colors.amber,),
                  Icon(Icons.star, size: 20, color: Colors.amber,),
                  Icon(Icons.star, size: 20, color: Colors.amber,),
                  Icon(Icons.star, size: 20, color: Colors.amber,),
                ],
              ),
            ),
            Text('$pengikut Pengikut', textAlign: TextAlign.center, style: TextStyle(color: Colors
                .grey[800], fontFamily: 'sofiapro-light', fontSize: 14),),
            Text('$aksiGalangAmal Aksi Galang Amal', textAlign: TextAlign.center, style: TextStyle(color: Colors
                .grey[800], fontFamily: 'sofiapro-light', fontSize: 14),),
            SizedBox(height: 15,),
            Container(
              height: 35,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(45),
                border: Border.all(width: 2, color: Colors.green)
              ),
              child: FlatButton(
                onPressed: () {
                },
                child: Text(
                  "Follow",
                  style: TextStyle(fontFamily: 'sofiapro-bold', fontSize: 16, color: Colors.green),
                ),
                color: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(45)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
