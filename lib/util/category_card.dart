import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final iconImage;
  final String categoryName;
  final Function function;

  CategoryCard(
      {required this.iconImage,
      required this.categoryName,
      required this.function});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0),
      child: Container(
        padding: EdgeInsets.all(13),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
        ),
        child: TextButton(
          onPressed: () => function(),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              // IconButton(
              //   onPressed: () {
              //     function();
              //   },
              //   icon: Image.asset(
              //     iconImage,
              //     height: 70,
              //   ),
              // ),
              SizedBox(
                width: 5,
              ),
              Text(
                categoryName,
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
