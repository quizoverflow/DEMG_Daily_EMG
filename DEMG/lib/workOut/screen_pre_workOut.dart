import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PreWorkOutScreen extends StatelessWidget {
  PreWorkOutScreen(){super.key;}
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('asset/debug_img/post_workOut_description.png'),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
      ),
    );
  }
}
