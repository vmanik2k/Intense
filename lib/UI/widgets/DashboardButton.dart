import 'package:flutter/material.dart';
import 'package:intense/UI/utility/constants.dart';

class DashboardBtn extends StatelessWidget {
  final Function onPressed;
  final IconData icon;
  final String label;
  final Color tileColor;

  const DashboardBtn(
      {required this.icon, required this.label, required this.onPressed, required this.tileColor});

  get onTap => onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        padding: EdgeInsets.only(left:35.0, bottom: 35.0),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.365,
          height: MediaQuery.of(context).size.height * 0.185,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: tileColor,
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                color: Colors.black54,
                blurRadius: 8.0,
                offset: Offset(0, 2),
              ),
            ],
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFFA97BD5),
                Color(0XFF8340C2),
              ],
              stops: [0.1, 0.6],
            ),
          ),
          child: InkWell(
            splashColor: Colors.black12.withAlpha(10),
            onTap: onTap,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Icon(
                  icon,
                  size: 40,
                  color: Colors.white,
                ),
                Text(
                  label,
                  style: kLabelStyle
                ),
              ]
            ),
          ),
        ),
    );
  }
}