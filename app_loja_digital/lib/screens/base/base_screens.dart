import 'package:app_loja_digital/common/custom_drawer/custom_drawer.dart';
import 'package:flutter/material.dart';

class BaseScreen extends StatelessWidget {

  final PageController pageController = PageController();

  BaseScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller : pageController,
      physics: const NeverScrollableScrollPhysics(),
      children: <Widget>[
        Scaffold(
          drawer: CustomDrawer(),
          appBar: AppBar(
            title: const Text('Home'),
          ),
        ),
        Container(color: Colors.red,),
        Container(color: Colors.yellow,),
        Container(color: Colors.green,),
      ]
    );
  }



}