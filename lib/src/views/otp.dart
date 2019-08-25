import 'package:flutter/material.dart';
import '../../custome_icon/navigation_icon_icons.dart';
import '../../style.dart';

class Otp extends StatefulWidget {
  @override
  _OtpState createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  FocusNode focusNode1 = new FocusNode();
  FocusNode focusNode2 = new FocusNode();
  FocusNode focusNode3 = new FocusNode();
  FocusNode focusNode4 = new FocusNode();
  FocusNode focusNode5 = new FocusNode();

  TextEditingController otpDigit1Ctrl = new TextEditingController();
  TextEditingController otpDigit2Ctrl = new TextEditingController();
  TextEditingController otpDigit3Ctrl = new TextEditingController();
  TextEditingController otpDigit4Ctrl = new TextEditingController();
  TextEditingController otpDigit5Ctrl = new TextEditingController();
  TextEditingController otpDigit6Ctrl = new TextEditingController();

  String otp;
  bool otpFilled = false;
  bool isSubmitted = false;

  void checkTextFieldOtp() {
    setState(() {
      if (!otpDigit1Ctrl.text.isEmpty &&
          !otpDigit2Ctrl.text.isEmpty &&
          !otpDigit3Ctrl.text.isEmpty &&
          !otpDigit4Ctrl.text.isEmpty) {
        otpFilled = true;
      } else {
        otpFilled = false;
      }
    });
  }

  void submit() {
    setState(() {
      isSubmitted = true;
    });
    otp = otpDigit1Ctrl.text +
        otpDigit2Ctrl.text +
        otpDigit3Ctrl.text +
        otpDigit4Ctrl.text +
        otpDigit5Ctrl.text +
        otpDigit6Ctrl.text;

    if (otp == otp) {
      Navigator.of(context).pushNamed('/login/data-diri');
    }
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
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Input OTP",
          style: TextStyle(color: Colors.black, fontSize: 22, fontFamily: 'sofiapro-bold'),
        ),
        centerTitle: true,
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
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    "Masukan kode OTP yang terkirim ke nomor telepon",
                    style: headphoneDescStyle,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Text(
                    "+62 815 **** 0909",
                    style: headingStyle,
                  ),
                ),
                Container(
                  height: 75,
                  width: 295,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                          height: 45,
                          width: 45,
                          decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(100)),
                          child: TextField(
                            controller: otpDigit1Ctrl,
                            style: headingStyle,
                            keyboardType: TextInputType.numberWithOptions(),
                            textInputAction: TextInputAction.next,
                            maxLength: 1,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(top: 5),
                              border: InputBorder.none,
                              counterText: '',
                              hintText: '-',
                              hintStyle: headingStyle,
                            ),
                            onChanged: (value) {
                              checkTextFieldOtp();
                              FocusScope.of(context).requestFocus(focusNode1);
                            },
                          )),
                      Container(
                          height: 45,
                          width: 45,
                          decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(100)),
                          child: TextField(
                            controller: otpDigit2Ctrl,
                            focusNode: focusNode1,
                            style: headingStyle,
                            keyboardType: TextInputType.numberWithOptions(),
                            textInputAction: TextInputAction.next,
                            maxLength: 1,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(top: 5),
                              border: InputBorder.none,
                              counterText: '',
                              hintText: '-',
                              hintStyle: headingStyle,
                            ),
                            onChanged: (value) {
                              checkTextFieldOtp();
                              FocusScope.of(context).requestFocus(focusNode2);
                            },
                          )),
                      Container(
                          height: 45,
                          width: 45,
                          decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(100)),
                          child: TextField(
                            controller: otpDigit3Ctrl,
                            focusNode: focusNode2,
                            style: headingStyle,
                            keyboardType: TextInputType.numberWithOptions(),
                            textInputAction: TextInputAction.next,
                            maxLength: 1,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(top: 5),
                              border: InputBorder.none,
                              counterText: '',
                              hintText: '-',
                              hintStyle: headingStyle,
                            ),
                            onChanged: (value) {
                              checkTextFieldOtp();
                              FocusScope.of(context).requestFocus(focusNode3);
                            },
                          )),
                      Container(
                          height: 45,
                          width: 45,
                          decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(100)),
                          child: TextField(
                            controller: otpDigit4Ctrl,
                            focusNode: focusNode3,
                            style: headingStyle,
                            keyboardType: TextInputType.numberWithOptions(),
                            textInputAction: TextInputAction.next,
                            maxLength: 1,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(top: 5),
                              border: InputBorder.none,
                              counterText: '',
                              hintText: '-',
                              hintStyle: headingStyle,
                            ),
                            onChanged: (value) {
                              checkTextFieldOtp();
                              FocusScope.of(context).requestFocus(focusNode4);
                            },
                          )),
                      Container(
                          height: 45,
                          width: 45,
                          decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(100)),
                          child: TextField(
                            controller: otpDigit5Ctrl,
                            focusNode: focusNode4,
                            style: headingStyle,
                            keyboardType: TextInputType.numberWithOptions(),
                            textInputAction: TextInputAction.next,
                            maxLength: 1,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(top: 5),
                              border: InputBorder.none,
                              counterText: '',
                              hintText: '-',
                              hintStyle: headingStyle,
                            ),
                            onChanged: (value) {
                              checkTextFieldOtp();
                              FocusScope.of(context).requestFocus(focusNode5);
                            },
                          )),
                      Container(
                          height: 45,
                          width: 45,
                          decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(100)),
                          child: TextField(
                            controller: otpDigit6Ctrl,
                            focusNode: focusNode5,
                            style: headingStyle,
                            keyboardType: TextInputType.numberWithOptions(),
                            textInputAction: TextInputAction.done,
                            maxLength: 1,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(top: 5),
                              border: InputBorder.none,
                              counterText: '',
                              hintText: '-',
                              hintStyle: headingStyle,
                            ),
                            onChanged: (value) {
                              checkTextFieldOtp();
                            },
                          )),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: Text(
                    "Kode OTP akan berakhir pada 4:19 detik",
                    style: headphoneDescStyle,
                  ),
                ),
                Container(
                  height: 35,
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: 75),
                  decoration: BoxDecoration(color: Colors.amber, borderRadius: BorderRadius.circular(45)),
                  child: FlatButton(
                    onPressed: () {
                      if (!isSubmitted) submit();
                    },
                    child: Text(
                      isSubmitted ? "Loading..." : "Selanjutanya",
                      style: TextStyle(
                          fontFamily: 'sofiapro-bold',
                          fontSize: 16,
                          color: otpFilled ? Colors.white : Colors.grey[700]),
                    ),
                    color: otpFilled ? Colors.green : Colors.grey[400],
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
}
