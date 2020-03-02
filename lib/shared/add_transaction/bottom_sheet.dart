import 'package:bethriftytoday/models/category.dart';
import 'package:bethriftytoday/models/transaction.dart';
import 'package:bethriftytoday/models/user.dart';
import 'package:bethriftytoday/services/database/category_db.dart';
import 'package:bethriftytoday/services/database/transaction_db.dart';
import 'package:bethriftytoday/shared/add_transaction/category_selector.dart';
import 'package:bethriftytoday/shared/add_transaction/txn_type_selector.dart';
import 'package:bethriftytoday/shared/thrifty_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddTransactionBottomSheet extends StatefulWidget {
  const AddTransactionBottomSheet({
    Key key,
  }) : super(key: key);

  @override
  _AddTransactionBottomSheetState createState() =>
      _AddTransactionBottomSheetState();
}

class _AddTransactionBottomSheetState extends State<AddTransactionBottomSheet> {
  double amount;
  String description;
  Category selectedCategory;

  bool isExpense = true;
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
                    onSaved: (v) => setState(() => description = v),
                    decoration: InputDecoration(
                      labelText: 'Description (optional)',
                    ),
                  ),
                  SizedBox(height: 30),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    onSaved: (v) => setState(() => amount = double.parse(v)),
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
                    onPressed: (this.selectedCategory != null)
                        ? this.addTransaction
                        : null,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  addTransaction() async {
    FocusScope.of(context).unfocus();
    var user = Provider.of<User>(context, listen: false);
    _formKey.currentState.save();

    Transaction transaction = Transaction(
      amount: amount * (isExpense ? -1 : 1),
      description: description,
      timestamp: DateTime.now(),
      category: selectedCategory,
    );
    TransactionDatabaseService(user).addTransaction(transaction);
    Navigator.pop(context);
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
          TransactionTypeSelector(
            title: 'Expense',
            isSelected: isExpense,
            onPressed: () => setIsExpense(true),
          ),
          TransactionTypeSelector(
            title: 'Income',
            isSelected: !isExpense,
            onPressed: () => setIsExpense(false),
          ),
        ],
      ),
    );
  }
}
