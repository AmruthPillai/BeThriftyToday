import 'package:bethriftytoday/config/colors.dart';
import 'package:bethriftytoday/models/category.dart';
import 'package:bethriftytoday/services/database/category_db.dart';
import 'package:bethriftytoday/shared/thrifty_button.dart';
import 'package:flutter/material.dart';

class AddTransactionBottomSheet extends StatefulWidget {
  const AddTransactionBottomSheet({
    Key key,
  }) : super(key: key);

  @override
  _AddTransactionBottomSheetState createState() =>
      _AddTransactionBottomSheetState();
}

class _AddTransactionBottomSheetState extends State<AddTransactionBottomSheet> {
  bool isExpense = true;
  Category selectedCategory;
  final _formKey = GlobalKey<FormState>();

  setIsExpense(bool value) => setState(() => isExpense = value);
  bool get isKeyboardOpen => MediaQuery.of(context).viewInsets.bottom > 0;
  bool isNumeric(String s) => (s == null) ? false : double.tryParse(s) != null;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      curve: Curves.easeInOutExpo,
      duration: Duration(milliseconds: 200),
      height: MediaQuery.of(context).size.height *
          (this.isKeyboardOpen ? 0.75 : 0.55),
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 30,
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: ListView(
          children: <Widget>[
            buildTypeSelector(),
            SizedBox(height: 30),
            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  buildCategorySelector(),
                  SizedBox(height: 30),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Description (optional)',
                    ),
                  ),
                  SizedBox(height: 30),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter an amount.';
                      }
                      if (!isNumeric(value)) {
                        return 'Please enter a valid number.';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        isExpense ? Icons.remove : Icons.add,
                      ),
                      labelText: 'Amount',
                    ),
                  ),
                  SizedBox(height: 30),
                  ThriftyButton(
                    title: 'Add'.toUpperCase(),
                    onPressed: (selectedCategory != null) ? () {} : null,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  StreamBuilder<List<Category>> buildCategorySelector() {
    return StreamBuilder<List<Category>>(
      stream: CategoryDatabaseService().categories,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var categories = snapshot.data
              .where((x) => x.type == (isExpense ? 'expense' : 'income'))
              .toList();
          return Container(
            width: double.infinity,
            height: 80,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                var x = categories[index];
                return CategorySelector(
                  category: x,
                  isSelected: x.name == selectedCategory?.name,
                  onPressed: () => setState(() => selectedCategory = x),
                );
              },
            ),
          );
        }
        return CircularProgressIndicator();
      },
    );
  }

  Container buildTypeSelector() {
    return Container(
      width: double.infinity,
      height: 40,
      child: Row(
        children: <Widget>[
          CategoryTypeOption(
            title: 'Expense',
            isSelected: isExpense,
            onPressed: () => setIsExpense(true),
          ),
          CategoryTypeOption(
            title: 'Income',
            isSelected: !isExpense,
            onPressed: () => setIsExpense(false),
          ),
        ],
      ),
    );
  }
}

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

class CategoryTypeOption extends StatelessWidget {
  final String title;
  final bool isSelected;
  final Function onPressed;

  const CategoryTypeOption({
    Key key,
    @required this.title,
    this.isSelected = false,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: this.onPressed,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: isSelected ? thriftyBlue : Colors.transparent,
            border: Border.all(
              width: 2,
              color: thriftyBlue,
            ),
          ),
          child: Center(
            child: Text(
              this.title.toUpperCase(),
              style: TextStyle(
                fontSize: 16,
                color: isSelected ? Colors.white : thriftyBlue,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
