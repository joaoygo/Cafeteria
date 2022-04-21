import 'package:cafeteira_ygo/ui/home_screen/home_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreenPage extends GetView<HomeScreenController> {
   
   const HomeScreenPage({Key? key}) : super(key: key);
   
   @override
   Widget build(BuildContext context) {
       return Scaffold(
           appBar: AppBar(title: const Text('HomeScreenPage'),),
           body: Container(),
       );
  }
}