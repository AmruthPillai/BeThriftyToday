import 'package:bethriftytoday/config/colors.dart';
import 'package:bethriftytoday/models/category.dart';
import 'package:bethriftytoday/services/database/category_db.dart';
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

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pop(context);
          },
          backgroundColor: Theme.of(context).accentColor,
          child: Icon(
            Icons.save,
            color: Colors.white,
          ),
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 25,
          ),
          child: ListView(
            children: <Widget>[
              buildTypeSelector(),
              SizedBox(height: 20),
              Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    buildCategorySelector(),
                    SizedBox(height: 20),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Description',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
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
                  isSelected: x.id == selectedCategory?.id,
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
