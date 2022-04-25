import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final iconImage;
  final String categoryName;

  CategoryCard({required this.iconImage, required this.categoryName});

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
        child: Row(
          children: [
            Image.asset(
              iconImage,
              height: 30,
            ),
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
    );
  }
}
