import 'package:bethriftytoday/models/category.dart';
import 'package:bethriftytoday/models/transaction.dart';
import 'package:bethriftytoday/models/user.dart';
import 'package:bethriftytoday/services/database/category_db.dart';
import 'package:bethriftytoday/services/database/transaction_db.dart';
import 'package:bethriftytoday/shared/transaction/category_selector.dart';
import 'package:bethriftytoday/shared/transaction/txn_type_selector.dart';
import 'package:bethriftytoday/shared/thrifty/thrifty_button.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class TransactionBottomSheet extends StatefulWidget {
  final Transaction transaction;

  const TransactionBottomSheet({
    Key key,
    this.transaction,
  }) : super(key: key);

  @override
  _TransactionBottomSheetState createState() => _TransactionBottomSheetState();
}

class _TransactionBottomSheetState extends State<TransactionBottomSheet> {
  String id;
  double amount;
  String description;
  DateTime timestamp;
  Category selectedCategory;

  var _descriptionNode = FocusNode();
  var _amountNode = FocusNode();

  bool isExpense = true;
  final _formKey = GlobalKey<FormState>();

  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _amountController = TextEditingController();
  TextEditingController _dateController = TextEditingController();

  setIsExpense(bool value) => setState(() => isExpense = value);
  bool get isKeyboardOpen => MediaQuery.of(context).viewInsets.bottom > 0;
  bool isNumeric(String s) => (s == null) ? false : double.tryParse(s) != null;

  @override
  void initState() {
    super.initState();
    var date = DateTime.now();
    var time = TimeOfDay.now();

    setDateTime(date, time);

    if (widget.transaction != null) {
      id = widget.transaction.id;
      amount = widget.transaction.amount;
      _amountController.text = amount.abs().toStringAsFixed(0);
      timestamp = widget.transaction.timestamp;
      setDateTime(timestamp, TimeOfDay.fromDateTime(timestamp));
      description = widget.transaction.description;
      _descriptionController.text = description;
      selectedCategory = widget.transaction.category;
    }
  }

  setDateTime(DateTime date, TimeOfDay time) {
    timestamp = DateTime(
      date.year,
      date.month,
      date.day,
      time.hour,
      time.minute,
    );

    _dateController.text = DateFormat().add_yMMMMd().add_jm().format(timestamp);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      curve: Curves.easeInOutExpo,
      duration: Duration(milliseconds: 200),
      height: MediaQuery.of(context).size.height *
          (this.isKeyboardOpen ? 0.8 : 0.6),
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
                    focusNode: _descriptionNode,
                    controller: _descriptionController,
                    onSaved: (v) => setState(() => description = v),
                    onFieldSubmitted: (v) =>
                        FocusScope.of(context).requestFocus(_amountNode),
                    decoration: InputDecoration(
                      labelText: 'Description (optional)',
                    ),
                  ),
                  SizedBox(height: 30),
                  TextFormField(
                    focusNode: _amountNode,
                    controller: _amountController,
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
                  TextFormField(
                    onTap: () async {
                      var date = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1990),
                        lastDate: DateTime.now(),
                      );

                      var time = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                      );

                      if (date != null || time != null) {
                        setState(() => setDateTime(date, time));
                      }
                    },
                    controller: _dateController,
                    readOnly: true,
                    decoration: InputDecoration(
                      labelText: 'Date',
                    ),
                  ),
                  SizedBox(height: 30),
                  ThriftyButton(
                    title: (widget.transaction != null)
                        ? 'Update'.toUpperCase()
                        : 'Add'.toUpperCase(),
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
      id: id,
      amount: amount * (selectedCategory.type == 'expense' ? -1 : 1),
      description: description,
      timestamp: timestamp,
      category: selectedCategory,
    );

    if (widget.transaction != null) {
      TransactionDatabaseService(user).updateTransaction(transaction);
    } else {
      TransactionDatabaseService(user).addTransaction(transaction);
    }

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
