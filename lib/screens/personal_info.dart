import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:material_color_utilities/utils/color_utils.dart';

class name extends StatefulWidget {
  name({Key? key}) : super(key: key);

  @override
  State<name> createState() => _nameState();
}

class _nameState extends State<name> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("hola")),
      body: cuerpo(),
    );
  }
}

Widget cuerpo() {
  return Container(
    decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(""))),
    child: Text("Primer texto"),
  );
}
