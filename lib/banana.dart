import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class BananaAnimation extends StatelessWidget {

  const BananaAnimation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Lottie.asset('assets/banana.json');    

  }

}