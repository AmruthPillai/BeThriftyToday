import 'package:bethriftytoday/config/colors.dart';
import 'package:bethriftytoday/models/category.dart';
import 'package:flutter/material.dart';

class CategorySelector extends StatelessWidget {
  final Category category;
  final bool isSelected;
  final Function onPressed;

  const CategorySelector({
    Key key,
    @required this.category,
    this.isSelected = false,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: this.onPressed,
      child: Container(
        width: 80,
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    width: 30,
                    height: 30,
                    child: Image.asset(
                      'assets/categories/${category.icon}',
                    ),
                  ),
                  Text(
                    category.name,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            isSelected
                ? Align(
                    alignment: Alignment.topRight,
                    child: Icon(
                      Icons.check_box,
                      color: thriftyBlue,
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
