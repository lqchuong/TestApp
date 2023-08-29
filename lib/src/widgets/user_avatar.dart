import 'package:flutter/material.dart';
import 'package:acecook/src/themes/light_color.dart';

class UserAvatar extends StatelessWidget {
  final String? imgUrl;
  final String userName;
  const UserAvatar({Key? key, this.imgUrl, required this.userName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
          color: LightColor.background,
          borderRadius: BorderRadius.circular(25.0)),
      padding: EdgeInsets.all(5),
      child: CircleAvatar(
        backgroundColor: LightColor.mainAppColor,
        child: imgUrl != null && imgUrl!.isNotEmpty
            ? Image.network(imgUrl!, fit: BoxFit.cover)
            : Text(
                userName.substring(0, 1).toUpperCase(),
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
      ),
    );
  }
}
