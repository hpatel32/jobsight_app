import 'package:flutter/material.dart';
// this .dart file is used to create the username company and password fields on the main page...
// it can also be used to add text fields to other pages
class CustomInputField extends StatelessWidget {
  Icon fieldIcon;
  String hintText;
  TextEditingController thisController;

  CustomInputField(this.fieldIcon,this.hintText, this.thisController);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: 250.0,
      child: Material(
        elevation: 5.0,
        color: Colors.blue[800],
        borderRadius: BorderRadius.all(Radius.circular(12.0)),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: fieldIcon,
              ),
              Container(
                width: 200.0,
                height: 65.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topRight: Radius.circular(12.0),bottomRight: Radius.circular(12.0)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      border: InputBorder.none,
                      hintText: hintText,),
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.black,
                    ),
                    controller: thisController,
                  ),
                ),
              ),
            ]
        ),
      ),
    );
  }
}