import 'package:bethriftytoday/config/config.dart';
import 'package:bethriftytoday/generated/l10n.dart';
import 'package:bethriftytoday/models/models.dart';
import 'package:bethriftytoday/services/category.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddCategoryDialog extends StatefulWidget {
  final String type;

  AddCategoryDialog(this.type);

  @override
  _AddCategoryDialogState createState() => _AddCategoryDialogState();
}

class _AddCategoryDialogState extends State<AddCategoryDialog> {
  String _selectedIcon;
  TextEditingController _nameController = TextEditingController();

  final List<String> icons = [
    'custom/custom_blue.png',
    'custom/custom_brown.png',
    'custom/custom_green.png',
    'custom/custom_indigo.png',
    'custom/custom_orange.png',
    'custom/custom_purple.png',
    'custom/custom_red.png',
    'custom/custom_teal.png',
    'custom/custom_yellow.png',
    'income/awards.png',
    'income/bonus.png',
    'income/freelance.png',
    'income/friends.png',
    'income/grants.png',
    'income/interest.png',
    'income/investments.png',
    'income/lottery.png',
    'income/others.png',
    'income/refunds.png',
    'income/rent.png',
    'income/salary.png',
    'income/sale.png',
    'expense/automobile.png',
    'expense/baby.png',
    'expense/books.png',
    'expense/charity.png',
    'expense/clothing.png',
    'expense/drinks.png',
    'expense/education.png',
    'expense/electronics.png',
    'expense/entertainment.png',
    'expense/food.png',
    'expense/friends.png',
    'expense/gifts.png',
    'expense/groceries.png',
    'expense/health.png',
    'expense/hobbies.png',
    'expense/insurance.png',
    'expense/investments.png',
    'expense/laundry.png',
    'expense/mobile.png',
    'expense/office.png',
    'expense/others.png',
    'expense/pets.png',
    'expense/rent.png',
    'expense/salon.png',
    'expense/shopping.png',
    'expense/tax.png',
    'expense/transportation.png',
    'expense/travel.png',
    'expense/utilities.png',
  ];

  @override
  Widget build(BuildContext context) {
    var categoryProvider = Provider.of<CategoryProvider>(context);

    return Container(
      margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      padding: const EdgeInsets.all(20),
      child: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Text(
            S.of(context).addCategoryBottomSheetHeadingText(
                '${widget.type[0].toUpperCase()}${widget.type.substring(1)}'),
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 10),
          Row(
            children: <Widget>[
              (_selectedIcon != null)
                  ? Row(
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            border: Border(
                              right: BorderSide(
                                width: 1,
                                color: Colors.grey.withOpacity(0.5),
                              ),
                            ),
                          ),
                          child: CategoryIcon(
                            icon: _selectedIcon,
                          ),
                        ),
                        SizedBox(width: 10),
                      ],
                    )
                  : Container(),
              Expanded(
                child: Container(
                  height: 80,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: icons.length,
                    itemBuilder: (context, index) {
                      return CategoryIcon(
                        onTap: () {
                          setState(() => _selectedIcon = icons[index]);
                        },
                        isSelected: _selectedIcon == icons[index],
                        icon: icons[index],
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          TextField(
            controller: _nameController,
            decoration: InputDecoration(
              labelText:
                  S.of(context).addCategoryBottomSheetLabelTextCategoryName,
            ),
          ),
          SizedBox(height: 15),
          Wrap(
            alignment: WrapAlignment.center,
            children: <Widget>[
              FlatButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                },
                textColor: Colors.red[600],
                icon: Icon(Icons.clear),
                label: Text(
                  S.of(context).addCategoryBottomSheetButtonTextCancel,
                ),
              ),
              FlatButton.icon(
                onPressed: () {
                  if (_nameController.text.isEmpty || _selectedIcon == null)
                    return;
                  categoryProvider.insert(Category(
                    id: 'custom_${UniqueKey().toString()}',
                    icon: _selectedIcon,
                    name: _nameController.text,
                    type: widget.type,
                  ));
                  Navigator.pop(context);
                },
                textColor: Theme.of(context).accentColor,
                icon: Icon(Icons.check),
                label: Text(
                  S.of(context).addCategoryBottomSheetButtonTextAdd,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CategoryIcon extends StatelessWidget {
  final Function onTap;
  final bool isSelected;
  final String icon;

  const CategoryIcon({
    Key key,
    this.onTap,
    this.isSelected = false,
    @required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: this.onTap,
      child: Container(
        width: 80,
        height: 80,
        child: Stack(
          children: <Widget>[
            isSelected
                ? Center(
                    child: Container(
                      width: 80,
                      color: thriftyBlue.withOpacity(0.2),
                    ),
                  )
                : Container(),
            Center(
              child: Container(
                width: 60,
                height: 60,
                padding: const EdgeInsets.all(8),
                child: Image.asset('assets/categories/$icon'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
