import 'package:flutter/material.dart';
import 'package:intense/UI/utility/constants.dart';

class ColumnReusableCardButton extends StatelessWidget {
  final Function onPressed;
  final String label;
  final IconData icon;
  final double height;
  final IconData directionIcon;
  final Color tileColor;
  final String directionIconHeroTag;
  // final double elevation;

  const ColumnReusableCardButton(
      {required this.onPressed,
      required this.icon,
      required this.label,
      required this.tileColor,
      required this.height,
      required this.directionIcon,
      required this.directionIconHeroTag,
      // this.elevation
      });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Container(
        // constraints: BoxConstraints(maxWidth: 400),
        color: tileColor,
        // elevation: elevation ?? 4,
        child: MaterialButton(
          minWidth: MediaQuery.of(context).size.width,
          height: (height == null)? 90 : height,
          onPressed: onPressed(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Icon(
                icon,
                size: 45,
                color: Colors.white,
              ),
              Text(
                label,
                maxLines: 2,
                style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.w600),
              ),
              Hero(
                tag: directionIconHeroTag,
                transitionOnUserGestures: true,
                child: Icon(
                  directionIcon,
                  color: Colors.white,
                  size: 55,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
