import 'package:flutter/material.dart';

class ProfilePhoto extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: MediaQuery.of(context).size.height*0.04,
      backgroundImage: AssetImage('assets/images/man.jpg'),
    );
  }
}
