import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:agrocart/constants.dart';

class LogoutItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool hasNavigation;

  const LogoutItem({
    Key key,
    this.icon,
    this.text,
    this.hasNavigation = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kSpacingUnit.w * 5.5,
      margin: EdgeInsets.symmetric(
        horizontal: kSpacingUnit.w * 4,
      ).copyWith(
        bottom: kSpacingUnit.w * 2,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: kSpacingUnit.w * 2,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kSpacingUnit.w * 3),
        color: Colors.yellow[700],
      ),
      child: Row(
        children: <Widget>[
          Icon(this.icon, size: kSpacingUnit.w * 3,color: Colors.white,),
          SizedBox(width: kSpacingUnit.w * 1.5),
          Text(this.text, style: kTitleTextStyle.copyWith(fontWeight: FontWeight.w600,color: Colors.white,fontSize: kSpacingUnit.w*2),
          ),
          Spacer(),
          if (this.hasNavigation)
            Icon(
              LineAwesomeIcons.angle_right,
              size: kSpacingUnit.w * 2.5,
            ),
        ],
      ),
    );
  }
}
