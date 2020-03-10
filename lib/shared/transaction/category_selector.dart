import 'package:bethriftytoday/config/config.dart';
import 'package:bethriftytoday/generated/l10n.dart';
import 'package:bethriftytoday/models/models.dart';
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
      child: Stack(
        children: <Widget>[
          isSelected
              ? Align(
                  alignment: Alignment.center,
                  child: Container(
                    color: thriftyBlue.withOpacity(0.15),
                  ),
                )
              : Container(),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2),
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
          ),
        ],
      ),
    );
  }
}
