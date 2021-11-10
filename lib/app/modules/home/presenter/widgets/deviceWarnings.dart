import 'package:flutter/material.dart';

class DeviceWarnings {
  static Future<void> showUserDialog(
      BuildContext context, String email, String token) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        Size size = MediaQuery.of(context).size;
        return new WillPopScope(
          onWillPop: () async => false,
          child: SimpleDialog(
            backgroundColor: Colors.transparent,
            children: <Widget>[
              Container(
                decoration: new BoxDecoration(
                  border: Border.all(color: Colors.white, width: 3.0),
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  color: Colors.purple,
                  shape: BoxShape.rectangle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10.0,
                      offset: const Offset(0.0, 10.0),
                    ),
                  ],
                ),
                child: Center(
                  child: Column(children: [
                    SizedBox(height: 50),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 5.0),
                      width: size.width * 08,
                      child: Text(
                        "token: $token",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "email: $email",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.0,
                      ),
                    ),
                    SizedBox(height: 20),
                    _backButton(context),
                    SizedBox(height: 20),
                  ]),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  static Widget _backButton(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pop(),
      child: FittedBox(
          child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(100),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 3),
              blurRadius: 25,
              color: Colors.cyan.withOpacity(0.2),
            )
          ],
        ),
        alignment: Alignment.center,
        child: Text(
          'Voltar',
          style: TextStyle(color: Colors.purple, fontSize: 21.0),
        ),
      )),
    );
  }
}
